import 'package:bank/model/model.dart';
import 'package:bank/service/bank_service.dart';
import 'package:bank/ui-toolkit/ui_toolkit.dart' as ui_toolkit;
import 'package:bank/ui/route_data.dart';
import 'package:bank/ui/selector_name_value/list_item_name_value.dart';
import 'package:flutter/material.dart';

class InstructionForm {
  late final Portfolio portfolio;
  late final PaymentInterbank payment;
  late final ui_toolkit.Form form;
  late final ui_toolkit.Field fromAccount;
  late final ui_toolkit.Field toBank;
  late final ui_toolkit.Field? toBranch;
  late final TextEditingController? toBranchTextController;
  late final ui_toolkit.Field toAccount;
  late final ui_toolkit.Field amount;
  late final ui_toolkit.Field reference;

  InstructionForm(RouteData routeData, Configuration configuration, IBankService service) {
    portfolio = Portfolio(service);
    payment = PaymentInterbank(service);

    form = ui_toolkit.Form();
    fromAccount = ui_toolkit.Field("From account", null);
    fromAccount.addValidation(ui_toolkit.ValidationRequired("From account is required"));
    form.add(fromAccount);

    toBank = ui_toolkit.Field("Bank", null);
    toBank.addValidation(ui_toolkit.ValidationRequired("Banks is required"));
    form.add(toBank);

    toBranch = routeData.flowCustomisation.interbankAddBranchSelectionField(form);
    if (toBranch!= null) {
      toBranchTextController = TextEditingController();
    }

    toAccount = ui_toolkit.Field("Account number", null);
    toAccount.addValidation(ui_toolkit.ValidationRequired("To account number is required"));
    form.add(toAccount);

    amount = ui_toolkit.Field("Amount", null);
    amount.addValidation(ui_toolkit.ValidationRequired("Amount is required"));
    form.add(amount);

    reference = ui_toolkit.Field("Reference", null);
    routeData.flowCustomisation.interbankReferenceValidation(reference);
    form.add(reference);
  }

  void setBank(ListItemNameValue selectedBank) {
    toBranchTextController!.text = "";
    toBranch!.value.value = null;
  }
}
