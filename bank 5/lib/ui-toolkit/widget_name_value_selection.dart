part of 'ui_toolkit.dart';

typedef ValueSelectedCallback = void Function(ListItemNameValue value);

abstract class IValuesGenerator {
  List<ListItemNameValue> generate();
}

class WidgetNameValueSelection extends StatefulWidget {
  final Field field;
  final List<ListItemNameValue> values;
  final ValueSelectedCallback? valueSelectedCallback;
  final TextEditingController? textController;

  WidgetNameValueSelection(
      {required this.field, required IValuesGenerator valuesGenerator, super.key, this.textController, this.valueSelectedCallback})
      : values = valuesGenerator.generate();

  @override
  State<WidgetNameValueSelection> createState() => _WidgetNameValueSelectionState();
}

class _WidgetNameValueSelectionState extends State<WidgetNameValueSelection> {
  @override
  void initState() {
    super.initState();
    if (widget.textController == null) {
      _textEditingController = TextEditingController(text: widget.field.value.value?.toString());
    } else {
      _textEditingController = widget.textController!;
    }
  }

  @override
  void didUpdateWidget(covariant WidgetNameValueSelection oldWidget) {
    super.didUpdateWidget(oldWidget);
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
              ListItemNameValue? selectedValue = await showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                    top: Radius.circular(15),
                  )),
                  builder: (context) => SelectorNameValue(values: widget.values));
              if (selectedValue != null) {
                if (widget.valueSelectedCallback != null) {
                  widget.valueSelectedCallback!(selectedValue);
                }
                  widget.field.value.value = selectedValue;
                  _textEditingController.text = field.value.value?.toString() ?? "";
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

  late final TextEditingController _textEditingController;
}
