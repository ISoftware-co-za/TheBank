part of "model.dart";

class Account {
  final String number;
  final String name;
  final double balance;

  Account(this.number, this.name, this.balance);

Account.fromJson(Map<String, dynamic> json)
      : number = json['number'],
        name = json['name'],
        balance = json['balance'];
}

