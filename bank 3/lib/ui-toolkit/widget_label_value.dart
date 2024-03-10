part of 'ui_toolkit.dart';

class WidgetLabelValue extends StatelessWidget {
  final String label;
  final String value;
  const WidgetLabelValue({required this.label, required this.value, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color:Color.fromARGB(255, 120, 60, 60), fontSize: 14)),
          Text(value, style: const TextStyle(color:Colors.black, fontSize: 18))
        ]
      ),
    );
  }
}
