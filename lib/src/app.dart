import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:span/src/ui/login.dart';
import 'package:span/src/ui/main_screen.dart';
import 'package:span/src/ui/onboarding.dart';

class App extends HookWidget {
  final SharedPreferences prefs;

  App({this.prefs});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Span',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: _handleCurrentScreen(),
    );
  }

  Widget _handleCurrentScreen() {
    bool seen = (prefs.getBool('seen') ?? false);
    bool loggedIn = (prefs.getBool('loggedIn') ?? false);
    if (seen) {
      if (loggedIn) {
        return MainScreen();
      }
      return LoginScreen();
    }
    return Onboarding(prefs: prefs);
  }
}
