import 'LoginScreen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key:key);


  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
  super.initState();
  _navigatetohome();

}

_navigatetohome()async{
   await Future.delayed(Duration(milliseconds: 3000), () {});
   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
}

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
         Image.asset(
        "assets/img/welcome.png"),

SizedBox(height: 50),

            Container(
              child: Text('Cook App ^_^', style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),),
            ),
          ],
        ),
      ),
      backgroundColor:  Color.fromARGB(225, 54, 124, 225) ,
    );
  }
}