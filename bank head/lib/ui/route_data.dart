import 'package:bank/model/model.dart';
import 'package:bank/service/bank_service.dart';

class RouteData<T> {
  final Configuration configuration;
  final IBankService service;
  T? data;

  RouteData(this.configuration, this.service);
}
