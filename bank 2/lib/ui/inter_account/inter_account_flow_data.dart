class InterAccountFlowData {
  String fromAccountNumber;
  String toAccountNumber;
  String amount;
  String? reference;

  String? transactionIdentifier;

  InterAccountFlowData(this.fromAccountNumber, this.toAccountNumber, this.amount, this.reference);
}
