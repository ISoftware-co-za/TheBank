import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PageSuccess extends StatelessWidget {
  final String transactionIdentifier;
  const PageSuccess({required this.transactionIdentifier, super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    _showSuccessIcon(widgets);
    _showTransactionIdentifier(widgets);
    _showDoneButton(context, widgets);

    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 248, 245, 245),
        appBar: AppBar(
          title: const Text("Inter-account"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: widgets,
          ),
        ));
  }

  void _showSuccessIcon(List<Widget> widgets) {
    widgets.add(SizedBox(
      width: 100,
      height: 100,
      child: SvgPicture.asset('assets/images/success.svg'),
    ));
    widgets.add(const SizedBox(height: 60));
  }

  void _showTransactionIdentifier(List<Widget> widgets) {
    widgets.add(Text(transactionIdentifier, textAlign: TextAlign.center));
    widgets.add(const SizedBox(height: 20));
  }

  void _showDoneButton(BuildContext context, List<Widget> widgets) {
    widgets.add(ElevatedButton(
        onPressed: () {
          Navigator.of(context).popUntil((route) => route.isFirst);
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 220, 60, 60)),
            foregroundColor: MaterialStateProperty.all(Colors.white)),
        child: const Text("Done")));
  }
}
