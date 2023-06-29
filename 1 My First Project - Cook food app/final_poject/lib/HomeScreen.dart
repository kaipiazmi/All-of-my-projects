import 'package:final_poject/Foods/1omelet.dart';
import 'package:final_poject/Foods/2Nasgor.dart';
import 'package:final_poject/Foods/3migor.dart';
import 'package:final_poject/Foods/4gado.dart';
import 'package:flutter/material.dart';
import 'package:final_poject/profile.dart';
import 'package:final_poject/HomeScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});
  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Cook App"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
            ],
          ),
          Text.rich(
            TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: "welcome",
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
            style: TextStyle(fontSize: 50),
          ),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2.0)),
                prefixIcon: Icon(
                  Icons.search,
                  size: 18,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: "Search"),
          ),
          SizedBox(height: 30),
          Text(
            "Recomended Food",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          ),
          SizedBox(height: 30),
          SizedBox(
            height: 250,
            child: GridView(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => omelet()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/img/1omelet.png"),
                        Text("Telur Dadar"),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => nasgor()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/img/2nasgor.png"),
                        Text("Nasi Goreng"),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => MieGoreng()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/img/3miegor.png"),
                        Text("Mie Goreng Seafood"),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => GadoGado()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/img/4gado.png"),
                        Text("Gado-Gado"),
                      ],
                    ),
                  ),
                ),
              ],
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
            ),
          ),
        ]),
      ),
      backgroundColor: Color.fromARGB(225, 54, 124, 225),
    );
  }
}

// final foods = ["1omelet", "2nasgor", "3miegor", "4gado"];


