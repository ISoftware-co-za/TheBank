import 'package:flutter/material.dart';

import 'flows.dart';
import 'list_item_menu_item.dart';
import 'widget_menu.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    _addLogo(children);
    _addMenu(children);

    return Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
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

  void _addMenu(List<Widget> children) {
    children.add(const SizedBox(height: 20));
    children.add(WidgetMenu(menuItems: [
      ListItemMenuItem(label: 'Inter accounts', flowName: Flows.flowFinancialInterAccount),
      ListItemMenuItem(label: "Interbank", flowName: Flows.flowFinancialInterbank)
    ]));
  }
}
