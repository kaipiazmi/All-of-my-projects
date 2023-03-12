import 'package:final_poject/HomeScreen.dart';
import 'package:final_poject/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:final_poject/profile.dart';
import 'Navigation.dart';
import 'Foods/1omelet.dart';


Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
 
      home: SplashScreen(),
    );
  }
}
