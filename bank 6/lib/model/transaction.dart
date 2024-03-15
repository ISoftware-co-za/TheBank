part of "model.dart";

class Transaction {

  List<Bank>? banks;

  Transaction(IBankService service) : _service = service;

  Future<String?> perform(String type, Map<String,dynamic> parameters) async {
    return await _service.performTransaction(type, parameters);
  }

  final IBankService _service;
}
