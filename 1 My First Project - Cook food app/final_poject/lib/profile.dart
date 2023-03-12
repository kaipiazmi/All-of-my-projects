import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'HomeScreen.dart';
import 'package:flutter/material.dart';

class Aboutme extends StatefulWidget {
  const Aboutme({super.key});

  @override
  State<Aboutme> createState() => _AboutmeState();
}

class _AboutmeState extends State<Aboutme> {
 final double coverHeigt = 240;
 final double profileHeiht = 144;


  @override
  Widget build(BuildContext context) {
    final top = coverHeigt - profileHeiht / 2;
    return Scaffold(
      
      body: ListView(
      padding: EdgeInsets.zero,
      children:<Widget>[
      buildtop(),
      buildContent(),
      ],
 ),
  backgroundColor:  Color.fromARGB(225, 54, 124, 225) ,
 );
 }

 Widget buildtop(){
  final bottom = profileHeiht / 2;
  final top = coverHeigt - profileHeiht / 2;
  
  return Stack(
      clipBehavior: Clip.none,
      alignment : Alignment.center,
      children:[
      Container(
      margin: EdgeInsets.only(bottom: bottom),
      child:buildCoverImage(),
      ),
      Positioned(
        top: top,
        child: buildProfileImage(),
        ),
      ],
    );
 }

  Widget buildCoverImage() => Container(
    color: Colors.grey,
    child: Image.asset("assets/img/sanbericon.jpg",
    width: double.infinity,
    height: coverHeigt,
    fit: BoxFit.cover,
    
    ),

  );
 Widget buildProfileImage() => CircleAvatar(
  radius: profileHeiht / 2,
  backgroundColor: Colors.grey.shade800,
  backgroundImage: AssetImage("assets/img/profile.png"),
 );

 Widget buildSocialIcon(IconData icon) => CircleAvatar(
  radius: 25,
  child: Center(child: Icon(icon, size: 32)),
 );

 Widget buildAbout() => Container(
  padding: EdgeInsets.all(10),
 child: ListTile(
  
  title: Padding(
    padding: const EdgeInsets.only(bottom: 15.0),
    child: Text ('About Me', style: TextStyle(fontSize:20, fontWeight: FontWeight.w600),  ),
  ),
 
  subtitle: Text(
    'Flutter Developer adalah IT Talent yang membuat cross-platform applications menggunakan Flutter Framework, aplikasi lintas platform dari basis Coding tunggal yang efektif beroperasi di sistem Android, iOS, Windows, macOS, Linux, dan aplikasi web.',
    style: TextStyle (fontSize:18, fontWeight: FontWeight.w500),
  ),
 ),
 );

Widget buildContent() => Column(
  children: [
    const SizedBox( height: 8),
    Text(
      'Kaipi Azmi',
      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
    ),
    const SizedBox(height: 8),
    Text(
      'Flutter Software Engineer',
      style: TextStyle(fontSize: 20,color: Colors.black),
    ),

    

const SizedBox(height: 16),

  Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
        buildSocialIcon(FontAwesomeIcons.linkedin),
        const SizedBox(width: 12),
        buildSocialIcon(FontAwesomeIcons.twitter),
        const SizedBox(width: 12),
         buildSocialIcon(FontAwesomeIcons.instagram),
        const SizedBox(width: 12),
    ],
  ),
  const SizedBox(height: 16),
  Divider(),
  const SizedBox(height: 16),
  buildAbout(),


  ],
 );
 

}