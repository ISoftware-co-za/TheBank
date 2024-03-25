part of "model.dart";

class TransferInterAccount {
  Future<String?> perform(String fromAccount, String toAccount, String amount,
      String? reference, IBankService service) async {
    return await service.performTransaction(
        fromAccount, toAccount, double.parse(amount), reference);
  }
}
