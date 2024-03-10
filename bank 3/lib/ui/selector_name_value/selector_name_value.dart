import 'package:bank/ui/selector_name_value/list_item_name_value.dart';
import 'package:flutter/material.dart';

class SelectorNameValue extends StatelessWidget {
  final List<ListItemNameValue> values;

  const SelectorNameValue({required this.values, super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> nameValues = _listAccountCards(context, values);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: nameValues),
    );
  }

  List<Widget> _listAccountCards(BuildContext context, List<ListItemNameValue> values) {
    List<Widget> widgets = [];

    widgets.add(const SizedBox(height: 24));
    for (ListItemNameValue value in values) {
      widgets.add(GestureDetector(
        onTap: () {
              Navigator.pop(context, value);
            },
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(child: Text(value.name, style: const TextStyle(color: Colors.black, fontSize: 18))),
                Text(value.value, style: const TextStyle(color: Colors.grey, fontSize: 18)),
              ]),
            const Divider(thickness: 1, color: Color.fromARGB(255, 180, 180, 180)),
            const SizedBox(height: 8)
          ],
        )
        ),
      );
      widgets.add(const SizedBox(height: 12));
    }

    return widgets;
  }
}
