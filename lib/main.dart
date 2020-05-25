import 'package:corona_app/src/screens/onboarding_screen.dart';
import 'package:corona_app/src/theme/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Corona Info',
      theme: myTheme,
      home: OnboardingScreen(),
    );
  }
}

