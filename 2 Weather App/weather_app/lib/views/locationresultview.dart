import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:weather_app/Model/locationmodel.dart';

class LokasiCuaca extends StatelessWidget {
  final String cityName;
  final Lokasi lokasi;

  LokasiCuaca({required this.cityName, required this.lokasi});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          color: Color.fromRGBO(60, 71, 100, 1.0),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 15),
                Text(
                  'Cuaca Kota $cityName Sekarang',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18.0,
                      color: Color.fromRGBO(234, 234, 234, 0.804)),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: 90, //  lebar container
                  height: 90, //  tinggi container
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), // radius container
                    color: Color.fromRGBO(135, 206, 235, 0.8),
                  ),
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(20), // Menentukan radius gambar
                    child: Image.network(
                      'https://openweathermap.org/img/wn/${lokasi.icon}@2x.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '${lokasi.temp}°C',
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(87, 164, 241, 1)),
                ),
                SizedBox(height: 5),
                Text(
                  capitalizeEveryWord('${lokasi.deskripsi}'),
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(234, 234, 234, 1.0)),
                ),
                SizedBox(height: 15),
                Container(
                  color: Colors.blue,
                  height: 1,
                  child: Divider(),
                ),
                SizedBox(height: 28),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.wind_power,
                      color: rgbColor,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Laju angin: ',
                      style: titleFont,
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '${lokasi.wind} km/jam',
                          style: infoFont,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.water_drop,
                      color: Colors.blue,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Kelembapan: ',
                      style: titleFont,
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '${lokasi.humidity}%',
                          style: infoFont,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.arrow_downward,
                      color: Colors.orange,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Tekanan: ',
                      style: titleFont,
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '${lokasi.pressure} mmHg',
                          style: infoFont,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.thermostat,
                      color: Colors.red,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Terasa seperti: ',
                      style: titleFont,
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '${lokasi.feels_like}°C',
                          style: infoFont,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

String capitalizeEveryWord(String text) {
  if (text.isEmpty) return text;

  List<String> words = text.split(' ');
  List<String> capitalizedWords = words.map((word) {
    if (word.isEmpty) return word;
    return word[0].toUpperCase() + word.substring(1);
  }).toList();

  return capitalizedWords.join(' ');
}

TextStyle titleFont = const TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 18.0,
    color: Color.fromRGBO(234, 234, 234, 0.8));

TextStyle infoFont = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 18.0,
    color: Color.fromRGBO(234, 234, 234, 0.8));

Color rgbColor = Color.fromRGBO(135, 206, 235, 1.0);
