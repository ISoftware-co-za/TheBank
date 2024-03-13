part of 'ui_toolkit.dart';

class WidgetForm extends StatefulWidget {
  final List<FormItem> fields;
  final RouteData routeData;
  final VoidCallback onContinue;
  const WidgetForm({required this.fields, required this.routeData, required this.onContinue, super.key});

  @override
  State<WidgetForm> createState() => _WidgetFormState();
}

class _WidgetFormState extends State<WidgetForm> {
  @override
  initState() {
    super.initState();
    _buildFormData();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: _buildFormWidgets()));
  }

  void _buildFormData() {
    for (var fieldTemplate in widget.fields) {
      var field = Field(fieldTemplate.key, fieldTemplate.source, fieldTemplate.label, null);
      if (fieldTemplate.required) {
        field.addValidation(ValidationRequired(fieldTemplate.label));
      }
      if (fieldTemplate.maxLength != null) {
        field.addValidation(ValidationCharacterLength(
            maximumCharacters: fieldTemplate.maxLength,
            maximumCharactersMessage: "The value must be ${fieldTemplate.maxLength} characters or shorter."));
      }
      widget.routeData.form.add(field);
    }
  }

  List<Widget> _buildFormWidgets() {
    List<Widget> children = [];
    Field? bankField;
    Field? branchField;
    for (var field in widget.routeData.form.fields) {
      bool includeSizeBox = true;
      if (field.source == FormItemSource.entered) {
        children.add(WidgetField(field: field));
      } else if (field.source == FormItemSource.accounts) {
        children.add(WidgetAccountSelection(field: field, accounts: widget.routeData.portfolio.accounts));
      } else if (field.source == FormItemSource.banks) {
        bankField = _addBankSelection(bankField, field, children, branchField);
      }
     else if (field.source == FormItemSource.branches) {
        includeSizeBox = _addBranchSelection(includeSizeBox, branchField, field, bankField, children);
      }
      if (includeSizeBox) {
        children.add(const SizedBox(height: 24));
      }
    }

    children.add(ElevatedButton(
        onPressed: () {
          _continue(context);
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 220, 60, 60)),
            foregroundColor: MaterialStateProperty.all(Colors.white)),
        child: const Text("Continue")));

    return children;
  }

  Field? _addBankSelection(Field? bankField, Field field, List<Widget> children, Field? branchField) {
    // TODO: ValueGeneratorBank cannot be used here. Same for RouteData.
    bankField = field;
    children.add(WidgetNameValueSelection(
        field: field,
        valuesGenerator: ValueGeneratorBank(widget.routeData.banks.banks),
        valueSelectedCallback: (selectedBank) {
          setState(() {
            if (branchField != null) {
              _branchEditingController.text = "";
              branchField.value.value = null;
            }
          });
        }));
    return bankField;
  }

  bool _addBranchSelection(bool includeSizeBox, Field? branchField, Field field, Field? bankField, List<Widget> children) {
    includeSizeBox = false;
    branchField = field;
    if (bankField == null) {
      throw Exception("Cannot have a branch field, without having a bank field defined before it.");
    }
    if (bankField.value.value != null) {
      includeSizeBox = true;
      List<Branch>? branchesForBank =
          widget.routeData.banks.listBranchedForBank(bankField.getValueAs<ListItemNameValue>().value);
      if (branchesForBank == null) {
        throw Exception(
            "Cannot find the branches for the bank ${bankField.getValueAs<ListItemNameValue>().toString()}.");
      }
      children.add(WidgetNameValueSelection(
          field: field,
          valuesGenerator: ValueGeneratorBranch(branchesForBank),
          textController: _branchEditingController,
          valueSelectedCallback: null));
    }
    return includeSizeBox;
  }

  void _continue(BuildContext context) {
    _formKey.currentState!.validate();
    if (widget.routeData.form.validate()) {
      widget.onContinue();
    }
  }

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _branchEditingController = TextEditingController();
}
