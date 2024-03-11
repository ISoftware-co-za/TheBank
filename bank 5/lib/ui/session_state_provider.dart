import 'package:bank/ui/session_state.dart';
import 'package:flutter/material.dart';

class SessionStateProvider extends InheritedWidget {
  final SessionState state;

  const SessionStateProvider({super.key, required this.state, required super.child});

  @override
  bool updateShouldNotify(SessionStateProvider oldWidget) {
    return oldWidget.state != state;
  }

  static SessionStateProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SessionStateProvider>();
  }
}
