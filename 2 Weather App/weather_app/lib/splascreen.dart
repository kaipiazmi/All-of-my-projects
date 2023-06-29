import 'package:flutter/material.dart';

import 'package:weather_app/views/navigation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(seconds: 6), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Navigatornya()));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(18, 29, 59, 1.0),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Iconnya(),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Developernya(),
            ),
          ),
        ],
      ),
    );
  }
}

Widget Iconnya() => Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/image/logo1.png",
          width: 100,
          height: 100,
        ),
      ],
    );

Widget Developernya() => Column(
      children: [
        Text(
          textAlign: TextAlign.center,
          'dari K.A',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Color.fromRGBO(234, 234, 234, 0.897),
          ),
        ),
      ],
    );
