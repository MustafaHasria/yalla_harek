import 'dart:async';

import 'package:flutter/material.dart';
import 'package:yalla_harek/features/addandeditgame/presentation/views/add_and_edit_game_screen.dart';
import 'package:yalla_harek/features/main/presentation/views/main_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'splash_screen';

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {

  startTime() async {
    var _duration = const Duration(seconds: 2);
    return Timer(_duration, navigationPage);
  }

  Future<void> navigationPage() async {
    Navigator.pushReplacementNamed(context, MainScreen.id);
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/logo.png',
                width: 250,
                height: 250,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
