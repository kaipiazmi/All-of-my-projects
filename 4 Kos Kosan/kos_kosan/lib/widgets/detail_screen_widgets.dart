import 'package:flutter/material.dart';
import 'package:kos_kosan/view/style.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';

class DetailsSectionWidget extends StatelessWidget {
  final String namaKos;
  final String lokasi;
  final String rating;
  final String deskripsi;
  final String ruangan;
  final String harga;

  DetailsSectionWidget({
    required this.namaKos,
    required this.lokasi,
    required this.rating,
    required this.deskripsi,
    required this.ruangan,
    required this.harga,
  });

  void launchWhatsApp({
    required String phone,
    String message = "",
  }) async {
    String url() {
      if (Platform.isAndroid) {
        // For Android devices, use "wa.me" link
        return "https://wa.me/$phone/?text=${Uri.encodeComponent(message)}";
      } else {
        // For iOS and other devices, use "api.whatsapp.com" link
        return "https://api.whatsapp.com/send?phone=$phone&text=${Uri.encodeComponent(message)}";
      }
    }

    if (await canLaunch(url())) {
      await launch(url());
    } else {
      throw 'Could not launch WhatsApp. Make sure WhatsApp is installed on your device.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            namaKos,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Icon(
              Icons.location_on_outlined,
              color: Colors.blueAccent,
              size: 24.0,
            ),
            SizedBox(width: 5),
            Text(
              lokasi,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Text('   $deskripsi',
                textAlign: TextAlign.justify,
                style: AppTextStyles.paragrafdeskripsi),
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color.fromARGB(255, 204, 228, 255),
              ),
              child: Text(
                '$ruangan ruangan tersisa',
                style: TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 35, 111, 224),
                ),
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Harga: ',
                      style: AppTextStyles.textlokasi,
                    ),
                    Text(
                      'Rp$harga.000/bulan',
                      style: AppTextStyles.textlokasi,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Hubungi Pemilik :",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 5),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(160, 55),
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  launchWhatsApp(
                    phone: "6282171193348",
                    message: "Hello, Saya ingin bertanya tentang kos?",
                  );
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.call,
                      size: 24.0,
                      color: Colors.white,
                    ),
                    SizedBox(width: 5),
                    const Text(
                      "WhatsApp",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
