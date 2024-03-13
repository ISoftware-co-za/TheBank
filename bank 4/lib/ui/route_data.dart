import 'package:bank/model/model.dart';
import 'package:bank/service/bank_service.dart';
import 'package:bank/ui/flowCustomisationKE.dart';

import 'iFlowCustomisation.dart';
import 'flowCustomisationBW.dart';
import 'flowCustomisationZM.dart';

class RouteData<T> {
  final Configuration configuration;
  final IBankService service;
  late final IFlowCustomisation flowCustomisation;
  T? data;

  RouteData(this.configuration, this.service) {
    if (configuration.isBW()) {
      flowCustomisation = FlowCustomisationBW();
    } else if (configuration.isZM()) {
      flowCustomisation = FlowCustomisationZM();
    } else {
      flowCustomisation = FlowCustomisationKE();
    }
  }
}
