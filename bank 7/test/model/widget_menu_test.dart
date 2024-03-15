import 'package:bank/ui/menu/list_item_menu_item.dart';
import 'package:bank/ui/transaction/page_1_instruction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:bank/ui/menu/widget_menu.dart';

void main() {
  testWidgets('WidgetMenu displays menu items correctly', (WidgetTester tester) async {
    // Create a test widget
    Widget widget = MaterialApp(
      home: WidgetMenu(menuItems: [
        ListItemMenuItem(label: 'Menu Item 1', icon: 'menu_icon_1.svg', flowName: 'flow_name_1', formItems: []),
        ListItemMenuItem(label: 'Menu Item 2', icon: 'menu_icon_2.svg', flowName: 'flow_name_2', formItems: []),
      ]),
    );

    // Build and run the widget
    await tester.pumpWidget(widget);

    // Verify that the menu items are displayed correctly
    expect(find.text('Menu Item 1'), findsOneWidget);
    expect(find.text('Menu Item 2'), findsOneWidget);
    expect(find.byIcon(Icons.arrow_forward_ios), findsNWidgets(2));

    // Verify that tapping on a menu item navigates to the correct screen
    await tester.tap(find.text('Menu Item 1'));
    await tester.pump();
    expect(find.byType(PageInstruction), findsOneWidget);
  });
}
