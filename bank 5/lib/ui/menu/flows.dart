import 'package:flutter/material.dart';

import 'package:bank/model/model.dart';
import 'package:bank/service/bank_service.dart';
import 'package:bank/ui/inter_account/inter_account_flow_data.dart';
import 'package:bank/ui/inter_account/page_1_instruction.dart' as inter_account;
import 'package:bank/ui/interbank/inter_bank_flow_data.dart';
import 'package:bank/ui/interbank/page_1_instruction.dart' as interbank;
import 'package:bank/ui/route_data.dart';

class Flows {
  static const flowFinancialInterAccount = "InterAccount";
  static const flowFinancialInterbank = "Interbank";

  static void start(BuildContext context, String flowName, Configuration configuration, IBankService bankService) {
    switch (flowName) {
      case flowFinancialInterAccount:
        RouteData<InterAccountFlowData> routeData = RouteData(configuration, bankService);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => inter_account.PageInstruction(routeData: routeData)));
        break;

      case flowFinancialInterbank:
        RouteData<InterBankFlowData> routeData = RouteData(configuration, bankService);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => interbank.PageInstruction(routeData: routeData)));
      default:
        throw Exception(
            "Cannot star the flow '$flowName' as it is not defined in ui.menu.flow.dart. Please add a case for this flow.");
        break;
    }
  }
}
