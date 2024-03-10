import 'package:bank/ui/selector_name_value/list_item_name_value.dart';

class InterBankFlowData {
  String fromAccountNumber;
  ListItemNameValue toBank;
  ListItemNameValue? toBranch;
  String toAccountNumber;
  String amount;
  String? reference;

  String? transactionIdentifier;

  InterBankFlowData(this.fromAccountNumber, this.toBank, this.toBranch, this.toAccountNumber, this.amount, this.reference);
}
