part of "model.dart";

class TransferInterAccount {
  Future<String?> perform(IBankService service, String fromAccount,
      String toAccount, String amount,
      String? reference) async {
    return await service.performTransaction(
        fromAccount, toAccount, double.parse(amount), reference);
  }
}
