import 'package:flutter/material.dart';
import 'package:weather_app/Model/modelcuaca.dart';
import 'package:weather_app/services/cuacaapiclient.dart';
import 'package:weather_app/views/boxinfotambahan.dart';
import 'package:weather_app/views/cuacasekarang.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  CuacaApiClient client = CuacaApiClient();
  Cuaca? data;

  Future<void> getData() async {
    data = await client.getCurrentWeather("medan");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // menampilkan tampilan ke user
            return SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40.0,
                ),
                cuacaSekarang(
                  "${data!.cityName}",
                  "${data!.iconCode}",
                  "${data!.temp}",
                  "${data!.deskripsi}",
                ),
                SizedBox(
                  height: 30.0,
                ),
                Container(
                  color: Colors.blue,
                  height: 1,
                  width: 352,
                  child: Divider(),
                ),
                SizedBox(
                  height: 25.0,
                ),
                Text(
                  "Informasi Tambahan",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(234, 234, 234, 0.8),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                box_informasi_tambahan("${data!.wind}", "${data!.humidity}",
                    "${data!.pressure}", "${data!.feels_like}"),
              ],
            ));
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container();
        },
      ),
      backgroundColor: Color.fromRGBO(18, 29, 59, 1.0),
    ));
  }
}
