import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter001/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigateToHomeScreen();
  }


  navigateToHomeScreen() {
    Timer(Duration(seconds: 4), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MyHomePage(title: 'fluttor Demo'),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            height: 600,
            child: Image.asset(
              'assets/img/giphy.webp',
            ))
      ],
    );
  }
}
