import 'package:bank/ui/transaction/page_1_instruction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg_test/flutter_svg_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:bank/bank_service_provider.dart';
import 'package:bank/configuration_provider.dart';
import 'package:bank/model/model.dart';
import 'package:bank/ui/menu/list_item_menu_item.dart';
import 'package:bank/ui/menu/widget_menu.dart';
import 'package:bank/ui/session_state.dart';
import 'package:bank/ui/session_state_provider.dart';

import 'mock_bank_service.dart';

void main() {
  List<ListItemMenuItem>? menuItems;
  Portfolio? portfolio;
  Banks? banks;

  setUp(() async {
    menuItems = _generateMenu();
    banks = _generateBanks();
    portfolio = _generatePortfolio();
  });

  testWidgets('Number and order of menu ListTiles', (WidgetTester tester) async {
    await tester.pumpWidget(_generateWidgetMenu(menuItems!, banks!, portfolio!));

    expect(find.byType(ListTile), findsNWidgets(2));
    var menuListTiles = find.byType(ListTile);
    expect(find.descendant(of: menuListTiles.at(0), matching: find.text(menuItems![0].label)), findsOneWidget);
    expect(find.descendant(of: menuListTiles.at(1), matching: find.text(menuItems![1].label)), findsOneWidget);
  });

  testWidgets('Check trailing icons', (WidgetTester tester) async {
    await tester.pumpWidget(_generateWidgetMenu(menuItems!, banks!, portfolio!));

    expect(find.byIcon(Icons.arrow_forward_ios), findsExactly(2));
  });

  testWidgets('Check trailing icons', (WidgetTester tester) async {
    var menuItems = _generateMenu();
    List<SvgPicture> icons = [];
    for (int index = 0; index < menuItems.length; index++) {
      icons.add(SvgPicture.asset('assets/images/${menuItems[index].icon}'));
    }

    await tester.pumpWidget(_generateWidgetMenu(menuItems, banks!, portfolio!));
    expect(find.svg(icons[0].bytesLoader), findsOneWidget);
    expect(find.svg(icons[1].bytesLoader), findsOneWidget);
  });

  testWidgets('Check onTap navigation menu item 1', (WidgetTester tester) async {
    await tester.pumpWidget(_generateWidgetMenu(menuItems!, banks!, portfolio!));
    var menuListTiles = find.byType(ListTile);
    await tester.tap(menuListTiles.at(0));
    await tester.pumpAndSettle();

    var instructionPageFinder = find.byType(PageInstruction);
    expect(find.byType(PageInstruction), findsOneWidget);
    var instructionPage = tester.widget(instructionPageFinder) as PageInstruction;
    expect(instructionPage.routeData.banks, banks);
    expect(instructionPage.routeData.portfolio, portfolio);
    expect(instructionPage.routeData.transactionType, menuItems![0].flowName);
    expect(instructionPage.routeData.formItems, menuItems![0].formItems);
  });

  testWidgets('Check onTap navigation menu item 2', (WidgetTester tester) async {
    await tester.pumpWidget(_generateWidgetMenu(menuItems!, banks!, portfolio!));
    var menuListTiles = find.byType(ListTile);
    await tester.tap(menuListTiles.at(1));
    await tester.pumpAndSettle();

    var instructionPageFinder = find.byType(PageInstruction);
    expect(find.byType(PageInstruction), findsOneWidget);
    var instructionPage = tester.widget(instructionPageFinder) as PageInstruction;
    expect(instructionPage.routeData.transactionType, menuItems![1].flowName);
    expect(instructionPage.routeData.formItems, menuItems![1].formItems);
  });
}

Widget _generateWidgetMenu(List<ListItemMenuItem> menuItems, Banks banks, Portfolio portfolio) {
  List<ListItemMenuItem> menuItems = _generateMenu();
  return MaterialApp(
    home: Scaffold(
      body: BankServiceProvider(
        service: MockBankService(),
        child: ConfigurationProvider(
          configuration: Configuration("BW", banks),
          child: SessionStateProvider(state: SessionState(portfolio, menuItems), child: WidgetMenu(menuItems: menuItems)),
        ),
      ),
    ),
  );
}

Banks _generateBanks() {
  return Banks(true, [
    Bank("Bank of America", "bofa", [
      Branch("Main Branch", "mb"),
      Branch("Branch 2", "b2"),
    ]),
    Bank("Wells Fargo", "wf", [
      Branch("Main Branch", "mb"),
      Branch("Branch 2", "b2"),
    ]),
    Bank("Chase", "ch", [
      Branch("Main Branch", "mb"),
      Branch("Branch 2", "b2"),
    ]),
    Bank("Citi", "citi", [
      Branch("Main Branch", "mb"),
      Branch("Branch 2", "b2"),
    ]),
  ]);
}

Portfolio _generatePortfolio() {
  return Portfolio([
    Account("12000343424", "Checking", 1000.0),
    Account("12000343425", "Savings", 2000.0),
    Account("12000343426", "Credit Card", -500.0)]);
}

List<ListItemMenuItem> _generateMenu() {
  return [
    ListItemMenuItem(icon: 'interAccount.svg', label: 'Item 1', flowName: 'Flow 1', formItems: []),
    ListItemMenuItem(icon: 'interbank.svg', label: 'Item 2', flowName: 'Flow 2', formItems: []),
  ];
}
