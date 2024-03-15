import 'package:bank/model/model.dart';
import 'package:bank/service/bank_service.dart';
import 'package:bank/ui/flow_customisation_KE.dart';

import 'i_flow_customisation.dart';
import 'flow_customisation_BW.dart';
import 'flow_customisation_ZM.dart';

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
