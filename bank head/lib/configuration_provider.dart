import 'package:flutter/material.dart';

import 'model/model.dart';

class ConfigurationProvider extends InheritedWidget {
  final Configuration configuration;

  const ConfigurationProvider({super.key, required this.configuration, required super.child});

  @override
  bool updateShouldNotify(ConfigurationProvider oldWidget) {
    return oldWidget.configuration != configuration;
  }

  static ConfigurationProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ConfigurationProvider>();
  }
}
