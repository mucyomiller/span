// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:span/src/app.dart';
import 'package:span/src/ui/onboarding.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({});
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Build our app and trigger a frame.
    await tester.pumpWidget(App(
      prefs: prefs,
    ));

    // // Verify that our counter starts at 0.
    // expect(find.text('next'), findsOneWidget);
    // expect(find.text('skip'), findsNothing);

    expect(find.byWidget(Onboarding(prefs: prefs)), findsOneWidget);
  });
}
