import 'package:bank/model/model.dart';
import 'package:bank/service/bank_service.dart';
import 'package:bank/ui-toolkit/ui_toolkit.dart';

class RouteData {
  final IBankService service;
  final Portfolio portfolio;
  final Banks banks;
  final String transactionType;
  final List<FormItem> formItems;
  final FormX form;
  String? transactionReference;

  RouteData(this.service, this.portfolio, this.banks, this.transactionType, this.formItems) : form = FormX();
}
