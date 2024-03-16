import 'package:bank/service/bank_service.dart';
import 'package:bank/ui/route_data.dart';
import 'package:flutter/material.dart';

import '../../model/model.dart';
import '../../ui-toolkit/ui_toolkit.dart' as ui_toolkit;
import 'inter_account_flow_data.dart';
import 'package:bank/ui/inter_account/page_2_review.dart';

class PageInstruction extends StatefulWidget {
  final RouteData<InterAccountFlowData> routeData;

  const PageInstruction({required this.routeData, super.key});

  @override
  State<PageInstruction> createState() => _PageInstructionState();
}

class _PageInstructionState extends State<PageInstruction> {
  @override
  void initState() {
    super.initState();
    _setupForm(widget.routeData.configuration);
  }

  @override
  Widget build(BuildContext context) {
    _portfolio = Portfolio(BankService());
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 248, 245, 245),
        appBar: AppBar(title: const Text("Inter account")),
        body: SafeArea(
          child: FutureBuilder<List<Account>>(
            future: _portfolio.listAccounts(),
            builder: (context, accounts) {
              if (accounts.hasData) {
                return SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 24, 8, 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ui_toolkit.WidgetAccountSelection(field: _fromAccount, accounts: accounts.data!),
                          SizedBox(height: _sizeBoxHeight),
                          ui_toolkit.WidgetAccountSelection(field: _toAccount, accounts: accounts.data!),
                          SizedBox(height: _sizeBoxHeight),
                          ui_toolkit.WidgetField(field: _amount),
                          SizedBox(height: _sizeBoxHeight),
                          ui_toolkit.WidgetField(field: _reference),
                          SizedBox(height: 2 * _sizeBoxHeight),
                          ElevatedButton(
                              onPressed: () {
                                _continue(context);
                              },
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 220, 60, 60)),
                                  foregroundColor: MaterialStateProperty.all(Colors.white)),
                              child: const Text("Continue")),
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                return const Placeholder();
              }
            }
          )
        ));
  }

  void _setupForm(Configuration configuration) {
    _form = ui_toolkit.Form();

    _fromAccount = ui_toolkit.Field("From account", null);
    _fromAccount.addValidation(ui_toolkit.ValidationRequired("From account is required"));
    _form.add(_fromAccount);

    _toAccount = ui_toolkit.Field("To account", null);
    _toAccount.addValidation(ui_toolkit.ValidationRequired("To account is required"));
    _form.add(_toAccount);

    _amount = ui_toolkit.Field("Amount", null);
    _amount.addValidation(ui_toolkit.ValidationRequired("Amount is required"));
    _form.add(_amount);

    _reference = ui_toolkit.Field("Reference", null);
    widget.routeData.flowCustomisation.interAccountReferenceValidation(_reference);
    _form.add(_reference);
}

  void _continue(BuildContext context) {
    _formKey.currentState!.validate();
    if (_form.validate()) {
      widget.routeData.data =InterAccountFlowData(
          _fromAccount.value.value!.toString(),
          _toAccount.value.value!.toString(),
          _amount.value.value!.toString(),
          _reference.value.value?.toString());
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => PageReview(routeData: widget.routeData)));
    }
  }

  final _formKey = GlobalKey<FormState>();
  final double _sizeBoxHeight = 24;
  late final Portfolio _portfolio;
  late final ui_toolkit.Form _form;
  late final ui_toolkit.Field _fromAccount;
  late final ui_toolkit.Field _toAccount;
  late final ui_toolkit.Field _amount;
  late final ui_toolkit.Field _reference;
}
