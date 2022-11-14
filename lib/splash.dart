import 'dart:async';
import 'package:bmt_kbs/screens/auth/login.dart';
import 'package:bmt_kbs/screens/intro.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  checkIntroductionScreenFirstSeen(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool seen = (prefs.getBool('seen') ?? false);

    if (mounted) {
      if (seen) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ),
        );
      } else {
        await prefs.setBool('seen', true);
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const IntroductionScreen(),
          ),
        );
      }
    }
  }

  checkLoginStatus(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = (prefs.getString('token') ?? '');

    if (mounted) {
      if (token.isNotEmpty) {
        Timer(
          const Duration(seconds: 3),
          () => Navigator.of(context).pushReplacementNamed('/home'),
        );
      } else if (token.isEmpty) {
        Timer(
          const Duration(seconds: 3),
          () => Navigator.of(context).pushReplacementNamed('/login'),
        );
      } else {
        Timer(
          const Duration(seconds: 3),
          () => checkIntroductionScreenFirstSeen(context),
        );
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLoginStatus(context);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(color: Colors.white),
        child: Center(
          child: Image.asset('assets/img/bmt_kbs.png', width: 200),
        ),
      ),
    );
  }
}
