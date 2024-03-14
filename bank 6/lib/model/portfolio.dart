part of "model.dart";

class Portfolio {

  List<Account> accounts;

  Portfolio(this.accounts);

  @visibleForTesting
  factory Portfolio.fromJson(dynamic json) {
    List<Account> accounts = [];
    for(Map<String, dynamic> accountResponse in json) {
      accounts.add(Account.fromJson(accountResponse));
    }
    return Portfolio(accounts);
  }
}
