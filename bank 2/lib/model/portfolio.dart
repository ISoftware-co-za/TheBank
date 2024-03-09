part of "model.dart";

class Portfolio {

  Portfolio(IBankService service) : _service = service;

  // Generate tests for this method
  Future<List<Account>> listAccounts() async {
    Map<String, dynamic> response = await _service.listAccounts();
    List<Account> accounts = [];
    for(Map<String, dynamic> accountResponse in response["accounts"]) {
      accounts.add(Account.fromJson(accountResponse));
    }
    return accounts;
  }

  final IBankService _service;
}
