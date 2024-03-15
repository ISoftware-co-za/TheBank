import 'package:bank/ui/selector_account/list_item_account.dart';
import 'package:flutter/material.dart';

class SelectorAccount extends StatelessWidget {
  final List<ListItemAccount> accounts;

  const SelectorAccount({required this.accounts, super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> accountCards = _listAccountCards(context, accounts);
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: accountCards);
  }

  List<Widget> _listAccountCards(BuildContext context, List<ListItemAccount> accounts) {
    List<Widget> cards = [];

    cards.add(const SizedBox(height: 24));
    for (ListItemAccount account in accounts) {
      cards.add(GestureDetector(
        onTap: () {
              Navigator.pop(context, account);
            },
        child: Card(
          color: const Color.fromARGB(255, 200, 40, 40),
          child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: _buildChildren(account)
                ),
              ),
        ),
      ));
      cards.add(const SizedBox(height: 12));
    }

    return cards;
  }

  List<Widget> _buildChildren(ListItemAccount account) {
    return [
      Text(account.name, style: const TextStyle(color: Colors.white, fontSize: 24)),
      const SizedBox(height: 16),
      Row(children:
      [Expanded(child: Text(account.number, style: const TextStyle(color: Colors.white, fontSize: 12))),
        Text(account.balance.toString(), style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w800))])
    ];
  }
}
