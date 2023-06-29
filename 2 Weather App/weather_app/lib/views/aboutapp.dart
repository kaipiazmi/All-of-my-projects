import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

Widget buildJudul() => Column(
      children: [
        Text(
          textAlign: TextAlign.center,
          'Aplikasi Cuaca ',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(234, 234, 234, 0.836),
          ),
        ),
      ],
    );

Widget buildAbout() => Container(
      padding: EdgeInsets.all(10),
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: Text(
            'Tentang Aplikasi',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Color.fromRGBO(234, 234, 234, 0.836),
            ),
          ),
        ),
        subtitle: Text(
          textAlign: TextAlign.left,
          '       Ini adalah aplikasi Cuaca Flutter & Dart yang menggunakan API untuk memperoleh data cuaca. Halaman utama menampilkan informasi cuaca untuk lokasi Medan secara default. Anda dapat melihat suhu, kondisi cuaca, kelembaban, dan kecepatan angin saat ini di Medan.\n\n'
          '       Selain itu, terdapat halaman kedua yang memungkinkan Anda melihat cuaca untuk kota lain. Anda dapat memasukkan nama kota yang ingin Anda cari dan aplikasi akan menampilkan perkiraan cuaca yang relevan untuk kota tersebut.\n\n'
          '       Aplikasi ini dirancang untuk memberikan pengalaman praktis dan cepat dalam memantau cuaca. Dengan antarmuka yang intuitif, Anda dapat dengan mudah memperoleh informasi cuaca terkini di lokasi yang Anda inginkan.',
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(234, 234, 234, 0.836)),
        ),
      ),
    );

Widget Iconnya() => Column(
      children: [
        Image.asset(
          "assets/image/logo1.png",
          width: 115,
          height: 115,
        ),
      ],
    );

Widget EasterEgg() => Column(
      children: [
        Text(
          textAlign: TextAlign.center,
          'Congratulation ^_^\nyou have found an Easter egg',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.red,
          ),
        ),
        SizedBox(height: 30.0),
        Text(
          textAlign: TextAlign.center,
          'Terimakasih banyak udah download yaaa',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color.fromRGBO(255, 255, 255, 0.81),
          ),
        ),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.wb_sunny_outlined,
              size: 32,
              color: Colors.orange,
            ),
            Icon(
              Icons.cloud_circle_outlined,
              size: 32,
              color: Colors.white,
            ),
            Icon(
              Icons.water_drop_outlined,
              size: 32,
              color: Colors.blue,
            ),
            Icon(
              Icons.thunderstorm_outlined,
              size: 32,
              color: Colors.yellow,
            ),
            Icon(
              Icons.whatshot_outlined,
              size: 32,
              color: Colors.red,
            ),
            Icon(
              Icons.snowing,
              size: 32,
              color: Colors.white,
            ),
          ],
        ),
        SizedBox(
          height: 25,
        ),
        Text(
          textAlign: TextAlign.center,
          'Salam Hangat Dari Developer',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color.fromRGBO(255, 255, 255, 0.81),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          textAlign: TextAlign.center,
          'Kaipi Azmi',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(255, 255, 255, 0.81),
          ),
        ),
        SizedBox(
          height: 190,
        ),
      ],
    );
