part of "model.dart";

class Portfolio {
  List<Account> listAccounts() {
    return [
      Account("1000000001234", "Checking", 100.0),
      Account("2000000005678", "Savings", 200.0),
      Account("3000000009012", "Investment", 300.0),
    ];
  }
}
