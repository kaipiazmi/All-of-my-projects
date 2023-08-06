import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:final_poject/Navigation.dart';
import 'package:final_poject/model/modelapi.dart';

Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://636dfddc182793016f32d807.mockapi.io/foods/1'));

  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
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

class omelet extends StatefulWidget {
  const omelet({super.key});

  @override
  State<omelet> createState() => _omeletState();
}

class _omeletState extends State<omelet> {
  final double coverHeigt = 240;
  final double profileHeiht = 144;
  late Future<Album> futureAlbum;
  late Album _album;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Album>(
        future: futureAlbum,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No data available.'));
          }

          _album = snapshot.data!;

          return Center(
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
          );
        },
      ),
      backgroundColor: Color.fromARGB(223, 197, 223, 255),
    );
  }

  Widget buildCoverImage() => Container(
        color: Colors.grey,
        child: Image.network(
          _album.gambar,
          width: double.infinity,
          height: coverHeigt,
          fit: BoxFit.cover,
        ),
      );

  Widget buildContent() => Container(
        child: Text(
          _album.tittle,
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
        ),
      );

  Widget BuildKomposisi() => Container(
        padding: EdgeInsets.only(left: 30.0),
        child: Text(
          _album.komposisi,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      );

  Widget BuildPembuatan() => Container(
        padding: EdgeInsets.only(left: 30.0, right: 30.0),
        child: Text(
          _album.pembuatan,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      );

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
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Navigatornya()),
            );
          },
        ),
      );

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.grey[300],
  );
}
