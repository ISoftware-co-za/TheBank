import 'package:bank/ui/interbank/page_1_instruction_form.dart';
import 'package:bank/ui/interbank/page_2_review.dart';
import 'package:bank/ui/interbank/value_generator_bank.dart';
import 'package:bank/ui/interbank/value_generator_branch.dart';
import 'package:bank/ui/selector_name_value/list_item_name_value.dart';
import 'package:flutter/material.dart';

import 'package:bank/model/model.dart';
import 'package:bank/ui/route_data.dart';
import 'package:bank/ui-toolkit/ui_toolkit.dart' as ui_toolkit;
import 'package:provider/provider.dart';

import 'inter_bank_flow_data.dart';

class PageInstruction extends StatefulWidget {
  final RouteData<InterBankFlowData> routeData;

  const PageInstruction({required this.routeData, super.key});

  @override
  State<PageInstruction> createState() => _PageInstructionState();
}

class _PageInstructionState extends State<PageInstruction> {
  @override
  void initState() {
    super.initState();
    _form = InstructionForm(widget.routeData.configuration, widget.routeData.service);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 248, 245, 245),
        appBar: AppBar(title: const Text("Interbank")),
        body: SafeArea(
            child: FutureBuilder<List<dynamic>>(
                future: Future.wait([_form.portfolio.listAccounts(), _form.payment.start()]),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    _bankValueGenerator ??= ValueGeneratorBank(_form.payment.banks!);
                    return SingleChildScrollView(
                      child: ChangeNotifierProvider<ui_toolkit.Field>(
                          create: (_) => _form.toBank,
                          builder: (context, child) {
                            List<Widget> children = [];
                            _showForm(
                                widget.routeData.configuration, snapshot.data![0], _bankValueGenerator!, children);
                            return Form(
                              key: _formKey,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(8, 24, 8, 8),
                                child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: children),
                              ),
                            );
                          }),
                    );
                  } else {
                    return const Placeholder();
                  }
                })));
  }

  void _showForm(Configuration configuration, List<Account> accounts, ValueGeneratorBank bankValueGenerator, List<Widget> children) {
    children.add(ui_toolkit.WidgetAccountSelection(field: _form.fromAccount, accounts: accounts));
    children.add(SizedBox(height: _sizeBoxHeight));
    children.add(ui_toolkit.WidgetNameValueSelection(
        field: _form.toBank,
        valuesGenerator: bankValueGenerator,
        valueSelectedCallback: (selectedBank) => setState(() {
              _form.setBank(selectedBank);
            })));
    children.add(SizedBox(height: _sizeBoxHeight));
    if (configuration.isBW()) {
      if (_form.toBank.value.value != null) {
        List<Branch>? branches = _form.payment.listBranches(_form.toBank.getValueAs<ListItemNameValue>().value);
        if (branches != null && branches.isNotEmpty) {
          children.add(ui_toolkit.WidgetNameValueSelection(
              field: _form.toBranch!, valuesGenerator: ValueGeneratorBranch(branches)));
          children.add(SizedBox(height: _sizeBoxHeight));
        }
      }
    }
    children.add(ui_toolkit.WidgetField(field: _form.toAccount));
    children.add(SizedBox(height: _sizeBoxHeight));
    children.add(ui_toolkit.WidgetField(field: _form.amount));
    children.add(SizedBox(height: _sizeBoxHeight));
    children.add(ui_toolkit.WidgetField(field: _form.reference));
    children.add(SizedBox(height: 2 * _sizeBoxHeight));
    children.add(ElevatedButton(
        onPressed: () {
          _continue(context);
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 220, 60, 60)),
            foregroundColor: MaterialStateProperty.all(Colors.white)),
        child: const Text("Continue")));
  }

  void _continue(BuildContext context) {
    _formKey.currentState!.validate();
    if (_form.form.validate()) {
      widget.routeData.data = InterBankFlowData(
          _form.fromAccount.value.value!.toString(),
          _form.toBank.getValueAs<ListItemNameValue>(),
          _form.toBranch?.getValueAs<ListItemNameValue>(),
          _form.toAccount.value.value!.toString(),
          _form.amount.value.value!.toString(),
          _form.reference.value.value?.toString());
      Navigator.push(context, MaterialPageRoute(builder: (context) => PageReview(routeData: widget.routeData)));
    }
  }

  final _formKey = GlobalKey<FormState>();
  late final InstructionForm _form;
  ValueGeneratorBank? _bankValueGenerator;
  final double _sizeBoxHeight = 24;
}
