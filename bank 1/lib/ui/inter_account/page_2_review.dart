import 'package:bank/model/model.dart';
import 'package:bank/service/bank_service.dart';
import 'package:bank/ui/inter_account/page_3_success.dart';
import 'package:bank/ui/route_data.dart';
import 'package:flutter/material.dart';
import 'package:bank/ui-toolkit/ui_toolkit.dart';
import 'package:bank/ui/inter_account/inter_account_transaction_data.dart';

class PageReview extends StatefulWidget {
  final RouteData<InterAccountTransactionData> routeData;
  const PageReview({required this.routeData, super.key});

  @override
  State<PageReview> createState() => _PageReviewState();
}

class _PageReviewState extends State<PageReview> {
  @override
  Widget build(BuildContext context) {
    List<Widget> columnChildren = [];
    _displayAmount(columnChildren);
    _displayTransactionData(columnChildren);
    _displayContinueButton(context, widget.routeData.service, columnChildren);

    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 230, 230, 230),
        appBar: AppBar(
          title: const Text("Inter-account"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
            children: columnChildren));
  }

  void _displayAmount(List<Widget> widgets) {
    widgets.add(Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 8),
      color: Colors.red,
      child: Center(
        child: Text(
          widget.routeData.data!.amount,
          style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w800),
        ),
      ),
    ));
    widgets.add(const SizedBox(height: 26,));
  }

  void _displayTransactionData(List<Widget> widgets) {
    widgets.add(WidgetLabelValue(label: "From", value: widget.routeData.data!.fromAccountNumber));
    widgets.add(WidgetLabelValue(label: "To", value: widget.routeData.data!.toAccountNumber));
    if (widget.routeData.data!.reference != null) {
      widgets.add(WidgetLabelValue(label: "Reference", value: widget.routeData.data!.reference!));
    }
    widgets.add(const SizedBox(height: 26,));
  }

  void _displayContinueButton(BuildContext context, IBankService service, List<Widget> widgets) {
    widgets.add(Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          onPressed: () async {
            await _performTransfer();
            if (!context.mounted) return;
              Navigator.push(context, MaterialPageRoute(builder: (context) => PageSuccess(data: widget.routeData.data!)));
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 220, 60, 60)),
              foregroundColor: MaterialStateProperty.all(Colors.white)
          ),
          child: const Text("Transfer")),
    ));
  }

  Future<void> _performTransfer() async {
    var interAccountTransfer = TransferInterAccount();
    widget.routeData.data!.transactionIdentifier = await interAccountTransfer.perform(
        widget.routeData.data!.fromAccountNumber,
        widget.routeData.data!.toAccountNumber,
        widget.routeData.data!.amount,
        widget.routeData.data!.reference);
  }
}
