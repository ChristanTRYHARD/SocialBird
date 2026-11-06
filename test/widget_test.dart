import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:social_bird/views/register_view.dart';
import 'package:social_bird/views/welcome_view.dart';

void main() {
  testWidgets('Login view displays login and registration actions', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: WelcomeView()));

    expect(find.text('Zaloguj'), findsOneWidget);
    expect(find.text('Zarejestruj'), findsOneWidget);
  });

  testWidgets('registration form validates required fields', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: RegisterView()));

    await tester.tap(find.text('Zarejestruj'));
    await tester.pump();

    expect(find.text('Podaj nazwę użytkownika'), findsOneWidget);
    expect(find.text('Podaj adres e-mail'), findsOneWidget);
    expect(find.text('Hasło musi mieć co najmniej 6 znaków'), findsOneWidget);
    expect(find.text('Powtórz hasło'), findsOneWidget);
  });

  testWidgets('registration form validates username, email and password', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(400, 350);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const MaterialApp(home: RegisterView()));

    await tester.enterText(find.byType(TextFormField).at(0), 'ab!');
    await tester.enterText(find.byType(TextFormField).at(1), 'invalid-email');
    await tester.enterText(find.byType(TextFormField).at(2), '12345');
    await tester.enterText(find.byType(TextFormField).at(3), 'different');
    await tester.tap(find.text('Zarejestruj'));
    await tester.pump();

    expect(find.text('Użyj 3-20 liter, cyfr lub znaków _'), findsOneWidget);
    expect(find.text('Podaj prawidłowy adres e-mail'), findsOneWidget);
    expect(find.text('Hasło musi mieć co najmniej 6 znaków'), findsOneWidget);
    expect(find.text('Hasła nie są takie same'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
