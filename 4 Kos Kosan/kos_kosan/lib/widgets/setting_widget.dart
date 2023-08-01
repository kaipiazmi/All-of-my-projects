import 'package:flutter/material.dart';
import 'dart:io';
import 'package:kos_kosan/view/style.dart';

class WidgetSetting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10),
          Container(
            height: 40, // Atur tinggi Container menjadi 50
            width: 300,
            padding: const EdgeInsets.symmetric(
              vertical: 6.0,
              horizontal: 10.0,
            ),
            margin: const EdgeInsets.symmetric(
              horizontal: 10.0, // Atur margin horizontal di sini
            ),
            decoration: BoxDecoration(
              color: Color.fromARGB(215, 218, 218, 218),
              borderRadius: const BorderRadius.all(
                Radius.circular(10.0),
              ),
              border: Border.all(
                width: 1.0,
                color: Colors.grey[400]!,
              ),
            ),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(3.0),
                  child: Icon(Icons.search),
                ),
                Expanded(
                  child: Opacity(
                    opacity:
                        0.3, // Atur tingkat transparansi teks di sini (0.0 - 1.0)
                    child: TextFormField(
                      initialValue: null,
                      decoration: const InputDecoration.collapsed(
                        filled: true,
                        fillColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        hintText: "Cari pengaturan...",
                      ),
                      onFieldSubmitted: (value) {},
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Column(
              children: [
                Container(
                  width: 285,
                  height: 50,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.person_outline_rounded,
                        size: 24.0,
                      ),
                      SizedBox(width: 10),
                      Text("Account", style: AppTextStyles.JudulTextsetting),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          size: 18.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 285,
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border(
                    top: BorderSide(
                        width: 0.5, color: Color.fromARGB(177, 116, 116, 116)),
                  )),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.notifications_none,
                        size: 24.0,
                      ),
                      SizedBox(width: 10),
                      Text("Notifikasi", style: AppTextStyles.JudulTextsetting),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          size: 18.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 285,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                          width: 0.5,
                          color: Color.fromARGB(177, 116, 116, 116)),
                    ),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.language,
                        size: 24.0,
                      ),
                      SizedBox(width: 10),
                      Text("Bahasa", style: AppTextStyles.JudulTextsetting),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          size: 18.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 285,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                          width: 0.5,
                          color: Color.fromARGB(177, 116, 116, 116)),
                      bottom: BorderSide(
                          width: 0.5,
                          color: Color.fromARGB(177, 116, 116, 116)),
                    ),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.lock_outline,
                        size: 24.0,
                      ),
                      SizedBox(width: 10),
                      Text("Privasi & Keamanan",
                          style: AppTextStyles.JudulTextsetting),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          size: 18.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 285,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          width: 0.5,
                          color: Color.fromARGB(177, 116, 116, 116)),
                    ),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.headphones,
                        size: 24.0,
                      ),
                      SizedBox(width: 10),
                      Text("Bantuan dan Support",
                          style: AppTextStyles.JudulTextsetting),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          size: 18.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 285,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          width: 0.5,
                          color: Color.fromARGB(177, 116, 116, 116)),
                    ),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.info_outline,
                        size: 24.0,
                      ),
                      SizedBox(width: 10),
                      Text("Tentang", style: AppTextStyles.JudulTextsetting),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          size: 18.0,
                        ),
                      ),
                    ],
                  ),
                ),
                // Tambahkan lebih banyak Container sesuai kebutuhan Anda
                SizedBox(height: 20),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(300, 55),
                      backgroundColor: Color.fromARGB(234, 242, 242, 242),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            20), // Atur nilai radius sesuai kebutuhan
                        side: BorderSide(
                          color: const Color.fromARGB(255, 255, 0, 0),
                          width: 2.0,
                        ), // Tambahkan border jika diinginkan
                      ),
                    ),
                    onPressed: () {
                      exit(0);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Keluar",
                          style: TextStyle(
                              color: Color.fromARGB(255, 64, 64, 64),
                              fontWeight: FontWeight.w700,
                              fontSize: 16),
                        )
                      ],
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
