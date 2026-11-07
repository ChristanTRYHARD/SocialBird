import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_bird/view_models/welcome_view_model.dart';
import 'package:social_bird/router/app_router.dart';

void main() {
  runApp(const SocialBirdApp());
}

/// Root Widget
class SocialBirdApp extends StatelessWidget {
  const SocialBirdApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WelcomeViewModel(),
      child: MaterialApp.router(
        routerConfig: appRouter,
        title: 'Social Bird',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue,
            brightness: Brightness.dark,
          ),
          useMaterial3: true,
        ),
      ),
    );
  }
}
