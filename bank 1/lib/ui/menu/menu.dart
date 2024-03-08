import 'package:flutter/material.dart';
import 'package:bank/ui/inter_account/page_1_instruction.dart' as inter_account;

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.arrow_forward),
              title: const Text("Inter account transfer"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const inter_account.PageInstruction())
                );
              },
            )
          ],
        ),
      )
    );
  }
}
