part of 'ui_toolkit.dart';

class WidgetReview extends StatelessWidget {
  final FormX form;
  final String amountKey;
  final List<String> fieldKeys;
  final VoidCallback onContinue;
  const WidgetReview(
      {required this.form, required this.amountKey, required this.fieldKeys, required this.onContinue, super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> columnChildren = [];
    _displayAmount(columnChildren);
    _displayTransactionData(columnChildren);
    _displayContinueButton(onContinue, columnChildren);

    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: columnChildren);
  }

  void _displayAmount(List<Widget> widgets) {
    widgets.add(Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 8),
      color: Colors.red,
      child: Center(
        child: Text(
          form.getField(amountKey).value.value.toString(),
          style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w800),
        ),
      ),
    ));
    widgets.add(const SizedBox(
      height: 26,
    ));
  }

  void _displayTransactionData(List<Widget> widgets) {
    for (String key in fieldKeys) {
      Field fieldWithKey = form.getField(key);
      if (fieldWithKey.value.value != null) {
        widgets.add(WidgetLabelValue(label: fieldWithKey.label, value: fieldWithKey.value.value.toString()));
      }
    }
    widgets.add(const SizedBox(
      height: 26,
    ));
  }

  void _displayContinueButton(VoidCallback onContinue, List<Widget> widgets) {
    widgets.add(Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          onPressed: onContinue,
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 220, 60, 60)),
              foregroundColor: MaterialStateProperty.all(Colors.white)),
          child: const Text("Transfer")),
    ));
  }
}
