import 'package:bank/model/model.dart';
import 'package:bank/ui-toolkit/ui_toolkit.dart';
import 'package:bank/ui/interbank/page_3_success.dart';
import 'package:bank/ui/route_data.dart';
import 'package:bank/ui/selector_name_value/list_item_name_value.dart';
import 'package:flutter/material.dart';

class PageReview extends StatelessWidget {
  final RouteData routeData;
  const PageReview({required this.routeData, super.key});

  @override
  Widget build(BuildContext context) {
    List<String> fieldKeys = ["FA", "BNK", "ACT", "REF"];
    if (routeData.banks.hasBranches) {
      fieldKeys.insert(2, "BRC");
    }
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 248, 245, 245),
        appBar: AppBar(
          title: const Text("Inter-account"),
        ),
        body: WidgetReview(
          form: routeData.form,
          amountKey: "AMT",
          fieldKeys: fieldKeys,
          onContinue: () async {
            await _performTransfer();
            if (!context.mounted) return;
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PageSuccess(transactionReference: routeData.transactionReference!)));
          },
        ));
  }

  Future<void> _performTransfer() async {
    var form = routeData.form;
    var paymentInterbank = PaymentInterbank(routeData.service);
    var bankIdentifier = (form.getField("BNK").value.value as ListItemNameValue).value;
    var branchCode = "";
    if (routeData.banks.hasBranches) {
      branchCode = (form.getField("BRC").value.value as ListItemNameValue).value;
    }
    routeData.transactionReference = await paymentInterbank.perform(
        form.getField("FA").value.value.toString(),
        form.getField("ACT").value.value.toString(),
        bankIdentifier,
        branchCode,
        form.getField("AMT").value.value.toString(),
        form.getField("REF").value.value.toString());
  }
}
