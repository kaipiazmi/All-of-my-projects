import 'package:flutter/material.dart';

class Warna {
  static const warna_utama = Color(0xFF42A5F5);
  static const Warna_kedua = Color(0xFF64B5F6);
  static const putih = Color.fromARGB(255, 255, 255, 255);
  static const hitam = Color.fromARGB(255, 64, 64, 64);
  static const abu_abu = Color.fromARGB(108, 158, 153, 153);

  // ... tambahkan warna lainnya di sini ...
}

class AppTextStyles {
  static const JudulText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 64, 64, 64),
  );

  static const JudulTextsetting = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: Color.fromARGB(255, 64, 64, 64),
  );

  static const subjudul = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: Color.fromARGB(255, 64, 64, 64),
  );

  static const paragrafdeskripsi = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Color.fromARGB(255, 64, 64, 64),
  );

  static const textlokasi = TextStyle(
    fontSize: 16,
    color: Color.fromARGB(255, 64, 64, 64),
  );
}
