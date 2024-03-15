part of "model.dart";

class PaymentInterbank {

  List<Bank>? banks;

  PaymentInterbank(IBankService service) : _service = service;

  Future<String?> perform(String fromAccount, String toAccount, String? bankIdentifier, String? branchCode, String amount, String? reference) async {
    var service = BankService();
    return await service.performTransaction(fromAccount, toAccount, double.parse(amount), reference, bankIdentifier, branchCode);
  }

  final IBankService _service;
}
