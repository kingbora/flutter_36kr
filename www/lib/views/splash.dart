import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'dart:async';

import 'package:flutter_36kr/routes/routes.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      navigationPage();
    });
  }

  void navigationPage() {
    Routes.routes.navigateTo(
      context,
      Routes.home,
      transition: TransitionType.fadeIn,
      transitionDuration: Duration(seconds: 1),
      clearStack: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/images/splash.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
