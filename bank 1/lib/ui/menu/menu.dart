import 'package:bank/bank_service_provider.dart';
import 'package:bank/configuration_provider.dart';
import 'package:bank/ui/inter_account/inter_account_flow_data.dart';
import 'package:bank/ui/route_data.dart';
import 'package:flutter/material.dart';
import 'package:bank/ui/inter_account/page_1_instruction.dart' as inter_account;

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    _addLogo(children);
    _addInterAccountTransfer(context, children);

    return Scaffold(
        body: SafeArea(
      child: Column(
        children: children,
      ),
    ));
  }

  void _addLogo(List<Widget> children) {
    children.add(SizedBox(
      width: 200,
      height: 100,
      child: Center(
        child: Image.asset('assets/images/logo.png'),
      ),
    ));
  }

  // Extract the ListTile into a method, similar to _addLogo
  void _addInterAccountTransfer(BuildContext context, List<Widget> children) {
    children.add(ListTile(
      leading: const Icon(Icons.arrow_forward),
      title: const Text("Inter account transfer"),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        RouteData<InterAccountFlowData> routeData = RouteData(
            ConfigurationProvider.of(context)!.configuration,
            BankServiceProvider.of(context)!.service);
        Navigator.push(context, MaterialPageRoute(builder: (context) => inter_account.PageInstruction(routeData: routeData)));
      },
    ));
  }
}
