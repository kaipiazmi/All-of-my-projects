import 'package:flutter/material.dart';
import 'package:weather_app/views/aboutapp.dart';

class AboutApp extends StatefulWidget {
  const AboutApp({super.key});

  @override
  State<AboutApp> createState() => _AboutAppState();
}

class _AboutAppState extends State<AboutApp> {
  final double coverHeigt = 240;
  final double profileHeiht = 144;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: new ListView(
          children: [
            const SizedBox(height: 40),
            buildJudul(),
            const SizedBox(height: 30),
            Iconnya(),
            const SizedBox(height: 25),
            buildAbout(),
            const SizedBox(height: 10000),
            EasterEgg(),
          ],
        ),
      ),
      backgroundColor: Color.fromRGBO(18, 29, 59, 1.0),
    );
  }
}
