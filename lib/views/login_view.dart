import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text('Zaloguj'),
            ),
            OutlinedButton(
              onPressed: () {},
              child: Text('Zarejestruj'),
            ),

          ],
        ),
      ),
    );
  }
}