part of "model.dart";

class Transaction {

  List<Bank>? banks;

  Transaction(IBankService service) : _service = service;

  Future<String?> perform(String type, Map<String,dynamic> parameters) async {
    String enteredAmount = parameters["AMT"];
    var serviceParameters = Map<String,dynamic>.from(parameters);
    serviceParameters["AMT"] = double.parse(enteredAmount);
    return await _service.performTransaction(type, serviceParameters);
  }

  final IBankService _service;
}
