import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:social_bird/views/welcome_view.dart';

void main() {
  testWidgets('Login view displays login and registration actions', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: WelcomeView()));

    expect(find.text('Zaloguj'), findsOneWidget);
    expect(find.text('Zarejestruj'), findsOneWidget);
  });
}
