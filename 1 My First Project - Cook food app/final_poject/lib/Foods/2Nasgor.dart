import 'dart:async';
import 'dart:convert';
import 'package:final_poject/pages/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:final_poject/Navigation.dart';

Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://636dfddc182793016f32d807.mockapi.io/foods/2'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Album {
  final String tittle;
  final String gambar;
  final String pembuatan;
  final String komposisi;

  const Album({
    required this.tittle,
    required this.gambar,
    required this.pembuatan,
    required this.komposisi,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      tittle: json['tittle'],
      gambar: json['gambar'],
      pembuatan: json['pembuatan'],
      komposisi: json['komposisi'],
    );
  }
}

class nasgor extends StatefulWidget {
  const nasgor({super.key});

  @override
  State<nasgor> createState() => _nasgorState();
}

class _nasgorState extends State<nasgor> {
  final double coverHeigt = 240;
  final double profileHeiht = 144;
  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  Widget buildCoverImage() => Container(
      color: Colors.grey,
      child: FutureBuilder<Album>(
        future: futureAlbum,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Image.network(
              snapshot.data!.gambar,
              width: double.infinity,
              height: coverHeigt,
              fit: BoxFit.cover,
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        },
      ));

  Widget buildContent() => Container(
          child: FutureBuilder<Album>(
        future: futureAlbum,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(
              snapshot.data!.tittle,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        },
      ));

  Widget BuildKomposisi() => Container(
      padding: EdgeInsets.only(left: 30.0),
      child: FutureBuilder<Album>(
        future: futureAlbum,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(
              snapshot.data!.komposisi,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        },
      ));

  Widget BuildPembuatan() => Container(
      padding: EdgeInsets.only(left: 30.0, right: 30.0),
      child: FutureBuilder<Album>(
        future: futureAlbum,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(
              snapshot.data!.pembuatan,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        },
      ));

  Widget BuildKembali() => Container(
        height: 50,
        width: 360,
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: ElevatedButton(
            style: raisedButtonStyle,
            child: Text(
              "Kembali",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => Navigatornya()));
            }),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: new ListView(
          children: [
            Center(child: buildCoverImage()),
            const SizedBox(height: 26),
            Center(child: buildContent()),
            const SizedBox(height: 26),
            Text(
              "  Bahan-Bahan :",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 5),
            BuildKomposisi(),
            const SizedBox(height: 10),
            Text(
              "  Cara Pembuatan :",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 5),
            BuildPembuatan(),
            const SizedBox(height: 300),
            BuildKembali(),
            const SizedBox(height: 20),
          ],
        ),
      ),
      backgroundColor: Color.fromARGB(223, 197, 223, 255),
    );
  }
}

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  onPrimary: Colors.grey[300],
);
