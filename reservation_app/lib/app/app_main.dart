
import 'package:flutter/material.dart';
import 'package:reservation_app/pages/sign_in/sign_up_page.dart';

import '../pages/sign_in/sign_in_page.dart';
import './app_routes.dart';

class SpaceApp extends StatelessWidget {
  const SpaceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.signIn,
      routes: {
        AppRoutes.signIn: (_) => SignInPage(),
        AppRoutes.signUp: (_) => SignUpPage(),
      },
    );
  }
}