import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:span/src/screens/onboarding.dart';
import 'package:span/src/screens/sign_in.dart';
import 'package:span/src/utils/material_swatch.dart';

class App extends HookWidget {
  final SharedPreferences prefs;

  App({this.prefs});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Span',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: createMaterialColor(Color(0xFF6C63FF)),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: _handleCurrentScreen(),
    );
  }

  Widget _handleCurrentScreen() {
    bool seen = (prefs.getBool('seen') ?? false);
    if (seen) {
      return SignIn();
    }
    return Onboarding(prefs: prefs);
  }
}
