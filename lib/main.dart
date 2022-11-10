import 'package:bmt_kbs/screens/auth/login.dart';
import 'package:bmt_kbs/screens/initial_page.dart';
import 'package:bmt_kbs/screens/intro.dart';
import 'package:bmt_kbs/splash.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Inter"),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        '/login': (context) => LoginPage(),
        '/intro': (context) => const IntroductionScreen(),
        '/home': (context) => const InitialPageScreen(),
      },
    );
  }
}
