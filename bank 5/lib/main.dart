import 'package:flutter/material.dart';

import 'package:bank/configuration_provider.dart';
import 'package:bank/bank_service_provider.dart';
import 'package:bank/service/bank_service.dart';
import 'package:bank/model/model.dart';
import 'package:bank/ui/session_state_provider.dart';
import 'package:bank/ui/session_state.dart';
import 'package:bank/ui/menu/menu.dart';

import 'model/model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // Replace menu within a FutureBuilder to load the Configuration and State.
        // Replace widget a BankServiceProvider to provide the BankService to the rest of the app.
        home: BankServiceProvider(
            service: BankService(),
            child: Builder(builder: (context) {
              return FutureBuilder<Configuration>(
                future: Configuration.load(BankServiceProvider.of(context)!.service),
                builder: (BuildContext context, AsyncSnapshot<Configuration> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return ConfigurationProvider(
                        configuration: snapshot.data!,
                        child: FutureBuilder<LoginResult>(
                            future: Login.login(BankServiceProvider.of(context)!.service, "username", "password"),
                            builder: (BuildContext context, AsyncSnapshot<LoginResult> snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return const CircularProgressIndicator();
                              } else if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else if (snapshot.hasData) {
                                return SessionStateProvider(
                                  state: SessionState(snapshot.data!.portfolio, snapshot.data!.banks),
                                  child: const Menu(),
                                );
                              } else {
                                return const Placeholder();
                              }
                            }));
                  }
                },
              );
            })));
  }
}
