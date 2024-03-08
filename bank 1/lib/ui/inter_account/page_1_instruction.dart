import 'package:bank/ui/inter_account/page_2_review.dart';
import 'package:flutter/material.dart';

import '../../model/model.dart';
import '../../ui-toolkit/ui_toolkit.dart' as ui_toolkit;
import 'inter_account_transaction_data.dart';

class PageInstruction extends StatefulWidget {
  const PageInstruction({super.key});

  @override
  State<PageInstruction> createState() => _PageInstructionState();
}

class _PageInstructionState extends State<PageInstruction> {
  @override
  void initState() {
    _portfolio = Portfolio();
    _fromAccount = ui_toolkit.Field("From account", null);
    _fromAccount.addValidation(ui_toolkit.ValidationRequired("From account is required"));

    _toAccount = ui_toolkit.Field("To account", null);
    _toAccount.addValidation(ui_toolkit.ValidationRequired("To account is required"));

    _amount = ui_toolkit.Field("Amount", null);
    _amount.addValidation(ui_toolkit.ValidationRequired("Amount is required"));

    _reference = ui_toolkit.Field("Reference", null);

    _form = ui_toolkit.Form();
    _form.add(_fromAccount);
    _form.add(_toAccount);
    _form.add(_amount);
    _form.add(_reference);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 230, 230, 230),
        appBar: AppBar(title: const Text("Inter-account")),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 24, 8, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ui_toolkit.WidgetAccountSelection(field: _fromAccount, accounts: _portfolio.listAccounts()),
                    SizedBox(height: _sizeBoxHeight),
                    ui_toolkit.WidgetAccountSelection(field: _toAccount, accounts: _portfolio.listAccounts()),
                    SizedBox(height: _sizeBoxHeight),
                    ui_toolkit.WidgetField(field: _amount),
                    SizedBox(height: _sizeBoxHeight),
                    ui_toolkit.WidgetField(field: _reference),
                    SizedBox(height: 2 * _sizeBoxHeight),
                    ElevatedButton(
                        onPressed: () {
                          _formKey.currentState!.validate();
                          if (_form.validate()) {
                            InterAccountTransactionData transactionData = InterAccountTransactionData(
                                _fromAccount.value.value!,
                                _toAccount.value.value!,
                                _amount.value.value!,
                                _reference.value.value!);
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) => PageReview(data: transactionData)));
                          }
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 220, 60, 60)),
                            foregroundColor: MaterialStateProperty.all(Colors.white)),
                        child: const Text("Continue")),
                  ],
                ),
              ),
            ),
          ),
        ));
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
