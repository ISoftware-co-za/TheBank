import 'package:flutter/material.dart';
import 'package:bank/service/bank_service.dart';

class BankServiceProvider extends InheritedWidget {
  final IBankService service;

  const BankServiceProvider({super.key, required this.service, required super.child});

  @override
  bool updateShouldNotify(BankServiceProvider oldWidget) {
    return oldWidget.service != service;
  }

  static BankServiceProvider? of(BuildContext context) {
    BankServiceProvider? provider = context.dependOnInheritedWidgetOfExactType<BankServiceProvider>();
    return provider;
  }
}
