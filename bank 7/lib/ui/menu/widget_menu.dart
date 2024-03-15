import 'package:bank/configuration_provider.dart';
import 'package:bank/ui/session_state.dart';
import 'package:bank/ui/session_state_provider.dart';
import 'package:flutter/material.dart';

import 'package:bank/bank_service_provider.dart';
import 'package:bank/service/bank_service.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../model/model.dart';
import '../route_data.dart';
import '../transaction/page_1_instruction.dart';
import 'list_item_menu_item.dart';

class WidgetMenu extends StatelessWidget {
  final List<ListItemMenuItem> menuItems;
  const WidgetMenu({required this.menuItems, super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> menuItems = _buildMenu(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: menuItems
    );
  }

  List<Widget> _buildMenu(BuildContext context) {
    Configuration configuration = ConfigurationProvider.of(context)!.configuration;
    IBankService service = BankServiceProvider.of(context)!.service;
    SessionState sessionState = SessionStateProvider.of(context)!.state;
    List<Widget> menuWidgets = [];

    for(ListItemMenuItem menuItem in menuItems) {
      menuWidgets.add(ListTile(
        leading: SvgPicture.asset("assets/images/${menuItem.icon}", width: 30, height: 30),
        title: Text(menuItem.label),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          RouteData routeData = RouteData(service, sessionState.portfolio, configuration.banks, menuItem.flowName, menuItem.formItems);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => PageInstruction(routeData: routeData)));
        },
      ));
    }
    return menuWidgets;
  }
}
