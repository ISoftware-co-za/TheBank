class InterAccountTransactionData {
  String fromAccountNumber;
  String toAccountNumber;
  String amount;
  String? reference;

  String? transactionIdentifier;

  InterAccountTransactionData(this.fromAccountNumber, this.toAccountNumber, this.amount, this.reference);
}
