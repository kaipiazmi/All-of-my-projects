import 'package:flutter/material.dart';

Widget cuacaSekarang(
    String location, String? iconCode, String temp, String kondisi) {
  return Container(
      margin: EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(41, 64, 130, 0.984),
                  Color.fromRGBO(158, 203, 255, 1),
                ],
              ),
              border: Border.all(
                color: Colors.blueAccent,
                width: 1.0,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "$location",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      iconCode != null
                          ? Image.network(
                              "https://openweathermap.org/img/wn/$iconCode@2x.png",
                            )
                          : Icon(
                              Icons.error,
                            ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 6.5),
                              child: Text(
                                capitalizeEveryWord("$kondisi"),
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "$temp°C",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 25.0),
                    ],
                  ),
                ],
              ),
            ),
          )));
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
