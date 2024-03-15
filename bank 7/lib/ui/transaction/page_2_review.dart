import 'dart:ffi';

import 'package:bank/model/model.dart';
import 'package:bank/ui-toolkit/ui_toolkit.dart';
import 'package:bank/ui/route_data.dart';
import 'package:flutter/material.dart';

import '../transaction/page_3_success.dart';

class PageReview extends StatelessWidget {
  final RouteData routeData;
  const PageReview({required this.routeData, super.key});

  @override
  Widget build(BuildContext context) {
    List<String> valueKeys = routeData.form.getKeys();
    valueKeys.remove("AMT");
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 248, 245, 245),
        appBar: AppBar(
          title: const Text("Inter-account"),
        ),
        body: WidgetReview(
          form: routeData.form,
          amountKey: "AMT",
          fieldKeys: valueKeys,
          onContinue: () async {
            await _performTransfer();
            if (!context.mounted) return;
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PageSuccess(transactionIdentifier: routeData.transactionReference!)));
          },
        ));
  }

  Future<void> _performTransfer() async {
    var form = routeData.form;
    var interAccountTransfer = Transaction(routeData.service);
    routeData.transactionReference = await interAccountTransfer.perform(routeData.transactionType, routeData.form.getValues());
  }
}
