import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

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