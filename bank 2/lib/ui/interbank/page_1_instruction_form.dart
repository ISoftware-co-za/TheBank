import 'package:bank/model/model.dart';
import 'package:bank/service/bank_service.dart';
import 'package:bank/ui-toolkit/ui_toolkit.dart' as ui_toolkit;
import 'package:bank/ui/selector_name_value/list_item_name_value.dart';

class InstructionForm {
  late final Portfolio portfolio;
  late final PaymentInterbank payment;
  late final ui_toolkit.Form form;
  late final ui_toolkit.Field fromAccount;
  late final ui_toolkit.Field toBank;
  late final ui_toolkit.Field toBranch;
  late final ui_toolkit.Field toAccount;
  late final ui_toolkit.Field amount;
  late final ui_toolkit.Field reference;

  InstructionForm(Configuration configuration, IBankService service) {
    portfolio = Portfolio(service);
    payment = PaymentInterbank(service);

    form = ui_toolkit.Form();
    fromAccount = ui_toolkit.Field("From account", null);
    fromAccount.addValidation(ui_toolkit.ValidationRequired("From account is required"));
    form.add(fromAccount);

    toBank = ui_toolkit.Field("Bank", null);
    toBank.addValidation(ui_toolkit.ValidationRequired("Banks is required"));
    form.add(toBank);

    if (configuration.isBW()) {
      toBranch = ui_toolkit.Field("Branch", null);
      toBranch.addValidation(ui_toolkit.ValidationRequired("Branch is required"));
      form.add(toBranch);
    }

    toAccount = ui_toolkit.Field("Account number", null);
    toAccount.addValidation(ui_toolkit.ValidationRequired("To account number is required"));
    form.add(toAccount);

    amount = ui_toolkit.Field("Amount", null);
    amount.addValidation(ui_toolkit.ValidationRequired("Amount is required"));
    form.add(amount);

    reference = ui_toolkit.Field("Reference", null);
    if (configuration.isBW()) {
      reference.addValidation(ui_toolkit.ValidationRequired("Reference is required"));
      reference.addValidation(ui_toolkit.ValidationCharacterLength(
          maximumCharacters: 20, maximumCharactersMessage: "Reference is too long"));
    } else if (configuration.isZM()) {
      reference.addValidation(ui_toolkit.ValidationCharacterLength(
          maximumCharacters: 15, maximumCharactersMessage: "Reference is too long"));
    }
    form.add(reference);
  }

  void setBank(ListItemNameValue selectedBank) {
      toBranch.value.value = null;
  }
}
