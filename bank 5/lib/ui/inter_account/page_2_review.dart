import 'dart:ffi';

import 'package:bank/model/model.dart';
import 'package:bank/ui-toolkit/ui_toolkit.dart';
import 'package:bank/ui/inter_account/page_3_success.dart';
import 'package:bank/ui/route_data.dart';
import 'package:flutter/material.dart';

class PageReview extends StatelessWidget {
  final RouteData routeData;
  const PageReview({required this.routeData, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 248, 245, 245),
        appBar: AppBar(
          title: const Text("Inter-account"),
        ),
        body: WidgetReview(
          form: routeData.form,
          amountKey: "AMT",
          fieldKeys: const ["FA", "TA", "REF"],
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
    var interAccountTransfer = TransferInterAccount();
    routeData.transactionReference = await interAccountTransfer.perform(
        form.getField("FA").value.value.toString(),
        form.getField("TA").value.value.toString(),
        form.getField("AMT").value.value.toString(),
        form.getField("REF").value.value.toString());
  }
}
