import "package:flutter/material.dart";
import "package:social_bird/router/app_router.dart";

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                appRouter.push('/home');
              },
              child: Text('Zaloguj'),
            ),
            Text('Nie masz konta?'),
            OutlinedButton(
              onPressed: () {
                appRouter.push('/register');
              },
              child: Text('Zarejestruj'),
            ),
          ],
        ),
      ),
    );
  }
}