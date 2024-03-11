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
  void initState() {
    super.initState();
    _generateFormTemplate();
  }

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
              fields: _formItems,
              routeData: widget.routeData,
              onContinue: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => PageReview(routeData: widget.routeData)));
              },
            ),
          ),
        )));
  }

  void _generateFormTemplate() {
    _formItems = [];
    _formItems.add(ui_toolkit.FormItem("FA", ui_toolkit.FormItemSource.accounts, "From account", true));
    _formItems.add(ui_toolkit.FormItem("TA", ui_toolkit.FormItemSource.accounts, "To account", true));
    _formItems.add(ui_toolkit.FormItem("AMT", ui_toolkit.FormItemSource.entered, "Amount", true));
    _formItems.add(ui_toolkit.FormItem("REF", ui_toolkit.FormItemSource.entered, "Reference", true, 15));
  }

  final _formKey = GlobalKey<FormState>();
  late final List<ui_toolkit.FormItem> _formItems;
}
