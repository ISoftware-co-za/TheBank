part of "model.dart";

class Transaction {

  List<Bank>? banks;

  Transaction(IBankService service) : _service = service;

  /*
  Future<void> start() async {
    List<Bank> banks = [];
    Map<String,dynamic> response = await _service.startOffUs();
    for(Map<String, dynamic> bankInResponse in response['banks']) {
      banks.add(Bank.fromJson(bankInResponse));
    }
    this.banks = banks;
  }

  List<Branch>? listBranches(String bankId) {
    if(banks!= null) {
      for(Bank bank in banks!) {
        if(bank.id == bankId) {
          return bank.branches;
        }
      }
    }
    return null;
  }
  */
  Future<String?> perform(String type, Map<String,dynamic> parameters) async {
    var service = BankService();
    return await service.performTransaction(type, parameters);
  }

  final IBankService _service;
}
