import 'package:flutter/material.dart';
import 'package:social_bird/router/app_router.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('----------------------------------'),
            Text('Social Bird'),
            Text('Utworz konto'),
            TextField(
            decoration: InputDecoration(
              labelText: 'Username',
            ),
          ),
                      TextField(
            decoration: InputDecoration(
              labelText: 'Email',
            ),
          ),
            TextField(
            decoration: InputDecoration(
              labelText: 'Password',
            ),
          ),
          TextField(
            decoration: InputDecoration(alignLabelWithHint: true,
              labelText: 'Confirm Password',
            ),
          ),
            ElevatedButton(
              onPressed: () {
                appRouter.push('/home');
              },
              child: Text('Zarejestruj'),
            ),
            Text('Masz już konto?'),
            ElevatedButton(
              onPressed: () {
                appRouter.push('/login');
              },
              child: Text('Zaloguj'),
            ),
            Text('----------------------------------'),
          ],
        ),
      ),
    );
  }    
}