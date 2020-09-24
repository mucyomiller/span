import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:span/src/ui/slider_page_view.dart';

class Onboarding extends StatefulWidget {
  final SharedPreferences prefs;
  Onboarding({this.prefs});
  @override
  State<StatefulWidget> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: SliderPageView(),
      ),
    );
  }
}
