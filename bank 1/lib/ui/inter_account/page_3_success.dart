import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'inter_account_transaction_data.dart';

class PageSuccess extends StatelessWidget {
  final InterAccountTransactionData data;
  const PageSuccess({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 230, 230, 230),
        appBar: AppBar(
          title: const Text("Inter-account"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            SizedBox(
              width: 100,
                height: 100,
                child: SvgPicture.asset('assets/success.svg')),
            const SizedBox(height: 60),
            const Text("321472143-43432-432432", textAlign: TextAlign.center,),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 220, 60, 60)),
                    foregroundColor: MaterialStateProperty.all(Colors.white)),
                child: const Text("Done"))
          ]),
        ));
  }
}
