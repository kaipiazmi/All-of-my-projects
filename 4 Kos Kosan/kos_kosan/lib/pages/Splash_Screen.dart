import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kos_kosan/pages/Navigasi_Bar.dart';
import 'package:kos_kosan/view/style.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double opacityLevel = 0.0;

  @override
  void initState() {
    super.initState();
    // Start the animation after the widget is built.
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        opacityLevel = 1.0;
      });
    });

    // Navigasi ke halaman LoginScreen setelah 3 detik menggunakan GetX
    Future.delayed(Duration(seconds: 4), () {
      Get.off(() => Navigatornya());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedOpacity(
          duration: Duration(seconds: 2), // Set the animation duration
          opacity: opacityLevel,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.house,
                size: 50.0,
                color: Color.fromARGB(255, 59, 54, 98),
              ),
              SizedBox(height: 5),
              Container(
                child: Text('Kos-Kosan', style: AppTextStyles.JudulText),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Color.fromARGB(224, 253, 253, 253),
    );
  }
}
