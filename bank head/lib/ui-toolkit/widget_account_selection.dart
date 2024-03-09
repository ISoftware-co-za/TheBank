part of 'ui_toolkit.dart';

class WidgetAccountSelection extends StatefulWidget {
  final Field field;
  final List<Account> accounts;

  const WidgetAccountSelection({required this.field, required this.accounts, super.key});

  @override
  State<WidgetAccountSelection> createState() => _WidgetSelectionState();
}

class _WidgetSelectionState extends State<WidgetAccountSelection> {
  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController(text: widget.field.value.value);
  }

  @override
  dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => widget.field,
      child: Consumer<Field>(
        builder: (context, field, child) {
          return TextFormField(
            readOnly: true,
            controller: _textEditingController,
            decoration: InputDecoration(
              border: const UnderlineInputBorder(),
              labelText: widget.field.label,
              labelStyle: const TextStyle(color: Color.fromARGB(255, 180, 100, 100)),
              filled: true,
              fillColor: Colors.white,
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
            ),
            onTap: () async {
              ListItemAccount? selectedAccount = await showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                    top: Radius.circular(15),
                  )),
                  builder: (context) => _buildBottomSheet(context, widget.accounts));
              if (selectedAccount != null) {
                _textEditingController.text = selectedAccount.number;
                widget.field.value.value = selectedAccount.number;
              }
            },
            onChanged: (value) {
              widget.field.value.value = value;
            },
            validator: (value) {
              widget.field.validateValue();
              return widget.field.invalidMessage.value;
            },
          );
        },
      ),
    );
  }

  AccountSelector _buildBottomSheet(BuildContext context, List<Account> accounts) {
    var listItemAccounts = <ListItemAccount>[];
    for (Account account in accounts) {
      listItemAccounts.add(ListItemAccount(account.name, account.number, account.balance));
    }
    return AccountSelector(accounts: listItemAccounts);
  }

  late final TextEditingController _textEditingController;
}
