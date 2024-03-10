part of 'ui_toolkit.dart';

class WidgetField extends StatefulWidget {
  final Field field;

  const WidgetField({required this.field, super.key});

  @override
  State<WidgetField> createState() => _WidgetFieldState();
}

class _WidgetFieldState extends State<WidgetField> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => widget.field,
      child: Consumer<Field>(
        builder: (context, field, child) {
          return TextFormField(
            decoration: InputDecoration(
              border: const UnderlineInputBorder(),
              labelStyle: const TextStyle(color: Color.fromARGB(255, 180, 100, 100)),
              labelText: widget.field.label,
              filled: true,
              fillColor: Colors.white,
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
            ),
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
}
