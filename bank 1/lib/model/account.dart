part of "model.dart";

class Account {
  final String number;
  final String name;
  final double balance;

  Account(this.number, this.name, this.balance);

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(json["number"], json["name"], json["balance"].toDouble());
  }
}

