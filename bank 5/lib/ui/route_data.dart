import 'package:bank/model/model.dart';
import 'package:bank/service/bank_service.dart';
import 'package:bank/ui-toolkit/ui_toolkit.dart';

class RouteData {
  final Configuration configuration;
  final IBankService service;
  final Portfolio portfolio;
  final Banks banks;
  final FormX form;
  String? transactionReference;

  RouteData(this.configuration, this.service, this.portfolio, this.banks) : form = FormX();
}
