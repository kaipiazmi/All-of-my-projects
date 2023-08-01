import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kos_kosan/pages/Splash_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // Ganti MaterialApp menjadi GetMaterialApp
      title: 'Kos Kosan App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}
