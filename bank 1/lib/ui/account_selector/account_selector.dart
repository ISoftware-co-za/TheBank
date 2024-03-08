import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bank/ui/account_selector/list_item_account.dart';

class AccountSelector extends StatelessWidget {
  final List<ListItemAccount> accounts;

  const AccountSelector({required this.accounts, super.key});

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
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                child: Column(
                  children: [
                    Text(account.name, style: const TextStyle(color: Colors.white, fontSize: 24)),
                    const SizedBox(height: 16),
                    Row(children:
                    [Expanded(child: Text(account.number, style: const TextStyle(color: Colors.white, fontSize: 12))),
                      Text(account.balance.toString(), style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w800))])
                  ],
                ),
              ),
        ),
      ));
      cards.add(const SizedBox(height: 12));
    }

    return cards;
  }
}
