import 'package:bank/configuration_provider.dart';
import 'package:bank/ui/session_state.dart';
import 'package:bank/ui/session_state_provider.dart';
import 'package:flutter/material.dart';

import 'package:bank/bank_service_provider.dart';
import 'package:bank/service/bank_service.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../model/model.dart';
import 'flows.dart';
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
        leading: SvgPicture.asset("assets/images/${menuItem.flowName}.svg", width: 30, height: 30),
        title: const Text("Inter account transfer"),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          Flows.start(context, menuItem.flowName, configuration, service, sessionState.portfolio, sessionState.banks);
        },
      ));
    }
    return menuWidgets;
  }
}
