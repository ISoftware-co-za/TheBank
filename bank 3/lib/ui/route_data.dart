import 'package:bank/model/model.dart';
import 'package:bank/service/bank_service.dart';
import 'package:bank/ui/flowCustomisationBW.dart';
import 'package:bank/ui/flowCustomisationZM.dart';
import 'package:bank/ui/iFlowCustomisation.dart';

class RouteData<T> {
  final Configuration configuration;
  final IBankService service;
  late final IFlowCustomisation flowCustomisation;
  T? data;

  RouteData(this.configuration, this.service) {
    if (configuration.isBW()) {
      flowCustomisation = FlowCustomisationBW();
    } else {
      flowCustomisation = FlowCustomisationZM();
    }
  }
}
