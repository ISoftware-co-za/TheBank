import 'package:bank/ui-toolkit/ui_toolkit.dart' as ui_toolkit;
import 'package:bank/ui/route_data.dart';
import 'package:flutter/material.dart';

import 'page_2_review.dart';

class PageInstruction extends StatefulWidget {
  final RouteData routeData;

  const PageInstruction({required this.routeData, super.key});

  @override
  State<PageInstruction> createState() => _PageInstructionState();
}

class _PageInstructionState extends State<PageInstruction> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 248, 245, 245),
        appBar: AppBar(title: const Text("Inter account")),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 24, 8, 8),
            child: ui_toolkit.WidgetForm(
              fields: widget.routeData.formItems,
              routeData: widget.routeData,
              onContinue: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => PageReview(routeData: widget.routeData)));
              },
            ),
          ),
        )));
  }

  final _formKey = GlobalKey<FormState>();
}
