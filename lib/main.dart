import 'package:flutter/material.dart';
import 'package:bw_contact_tracing_app/screens/splash_screen.dart';
import 'package:bw_contact_tracing_app/screens/main_screen.dart';
import 'package:bw_contact_tracing_app/screens/welcome_screen.dart';

void main() => runApp(BwApp());

class BwApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
        MainScreen.id: (context) => MainScreen(),
      },
    );
  }
}
