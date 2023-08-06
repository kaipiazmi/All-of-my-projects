import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Navigation.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  registerSubmit() async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: _emailController.text.toString().trim(),
        password: _passwordController.text,
      );
      // Successfully registered
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registrasi Berhasil')),
      );
    } catch (e) {
      print(e);
      String errorMessage = 'An error occurred during registration.';
      if (e is FirebaseAuthException) {
        errorMessage = e.message ?? errorMessage;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    }
  }

  loginSubmit() async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      // Successfully logged in
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) =>
                Navigatornya()), // Replace with your home screen
      );
    } catch (e) {
      print(e);
      String errorMessage = 'Email atau password salah';
      if (e is FirebaseAuthException) {
        if (e.code == 'user-not-found' || e.code == 'wrong-password') {
          errorMessage = 'Email atau password salah';
        }
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(223, 197, 223, 255),
      body: SafeArea(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'Hello ^_^',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),

            SizedBox(height: 10), //jarak dari atas

            Text(
              '  Mohon daftar/login terlebih dahulu ya! ',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 30),

            Image.asset(
              "assets/img/login.png",
            ),
            SizedBox(height: 30),

            //jarak dari atas

            //email textfield
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border:
                      Border.all(color: Colors.white), //warna garis luar kotak
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Email',
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            //Password textfield
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border:
                      Border.all(color: Colors.white), //warna garis luar kotak
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true, //segel pasword biar gk tau
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Password',
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 50),

            // register
            Container(
              height: 50,
              width: 360,
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                style: raisedButtonStyle,
                child: Text(
                  "Register",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                onPressed: () {
                  registerSubmit();
                },
              ),
            ),

            SizedBox(height: 10),

            //  Login button
            Container(
              height: 50,
              width: 360,
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                style: raisedButtonStyle,
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                onPressed: () async {
                  loginSubmit();
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  onPrimary: Colors.grey[300],
);
