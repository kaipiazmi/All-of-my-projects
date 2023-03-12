import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'HomeScreen.dart';
import 'package:flutter/material.dart';

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
      appBar: AppBar(
        centerTitle: true,
        title: Text("Cook App"), 
      ),
      body: Center(
        
      child: new ListView(
        
      children:[
         const SizedBox(height: 56),
      Center(child: buildProfileImage()),
     
      const SizedBox(height: 16),
      buildContent(),
      ],
     ),
 ),
  backgroundColor:  Color.fromARGB(225, 54, 124, 225) ,
 );
 }

 Widget buildProfileImage() => CircleAvatar(
  
  radius: 100,
  backgroundColor: Colors.grey.shade800,
  backgroundImage: AssetImage("assets/img/logoapp.png"),
 );


 Widget buildAbout() => Container(
  
  padding: EdgeInsets.all(10),
 child: ListTile(
  
  title: Padding(
    padding: const EdgeInsets.only(bottom: 15.0),
    child: Text ('About App', style: TextStyle(fontSize:25, fontWeight: FontWeight.w600),  ),
  ),
  subtitle: Text(
    'Aplikasi ini adalah aplikasi pertama saya, dibuat untuk menyelesaikan tugas akhir dari Bootcamp batch Sanbercode, dan saya harap dengan aplikasi adalah awal yang baik bagi saya untuk terjun dibidang flutter developer  ',
    style: TextStyle (fontSize:18, fontWeight: FontWeight.w500),
  ),
  ),
 
 );

Widget buildContent() => Column(
  children: [
    const SizedBox( height: 8),
    Text(
      'Cook App',
      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
    ),
   

  const SizedBox(height: 56),
  buildAbout(),


  ],
 );
 

}