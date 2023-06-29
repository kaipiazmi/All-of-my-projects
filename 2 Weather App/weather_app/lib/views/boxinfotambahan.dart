import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

TextStyle titleFont = const TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 18.0,
    color: Color.fromRGBO(234, 234, 234, 0.8));

TextStyle infoFont = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 18.0,
    color: Color.fromRGBO(255, 255, 255, 0.8));

Color rgbColor = Color.fromRGBO(135, 206, 235, 1.0);

Widget box_informasi_tambahan(
    String wind, String humidity, String preasure, String feel_like) {
  return Column(
    children: [
      Card(
        color: Color.fromRGBO(60, 71, 100, 1.0),
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.wind_power_rounded,
                color: rgbColor,
              ),
              SizedBox(width: 10),
              Text('Laju angin : ', style: titleFont),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text('$wind km/jam', style: infoFont),
                ),
              ),
            ],
          ),
        ),
      ),
      Card(
        color: Color.fromRGBO(60, 71, 100, 1.0),
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.opacity,
                color: Colors.blue,
              ),
              SizedBox(width: 10),
              Text('Kelembapan : ', style: titleFont),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text('$humidity%', style: infoFont),
                ),
              ),
            ],
          ),
        ),
      ),
      Card(
        color: Color.fromRGBO(60, 71, 100, 1.0),
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.arrow_downward,
                color: Colors.orange,
              ),
              SizedBox(width: 10),
              Text('Tekanan : ', style: titleFont),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text('$preasure mmHg', style: infoFont),
                ),
              ),
            ],
          ),
        ),
      ),
      Card(
        color: Color.fromRGBO(60, 71, 100, 1.0),
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.thermostat,
                color: Colors.red,
              ),
              SizedBox(width: 10),
              Text('Terasa seperti : ', style: titleFont),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text('$feel_like°C', style: infoFont),
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
