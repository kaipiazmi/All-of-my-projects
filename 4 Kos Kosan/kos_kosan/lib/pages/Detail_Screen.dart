import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:kos_kosan/widgets/detail_screen_widgets.dart';
import 'package:kos_kosan/controllers/home_controller.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';

class DetailScreen extends StatefulWidget {
  final String title;
  final String rating;
  final List<String> imageAssets; // List of image URLs
  final String namaKos;
  final String harga;
  final String deskripsi;
  final String ruangan;
  final String lokasi;

  // Constructor to receive data from the MyHomePage widget
  const DetailScreen({
    Key? key,
    required this.title,
    required this.rating,
    required this.imageAssets,
    required this.namaKos,
    required this.harga,
    required this.deskripsi,
    required this.ruangan,
    required this.lokasi,
  }) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final HomeController homeController = Get.find();
  final CarouselController _carouselController = CarouselController();
  int _currentIndex = 0;
  int phone = 082171193348;

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
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 238, 238),
      appBar: AppBar(
        toolbarHeight: 100, //atur tinggi appbar
        centerTitle: true,
        title: Text('Details'),
        backgroundColor: const Color.fromARGB(255, 238, 238, 238),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          padding: EdgeInsets.only(left: 30),
          onPressed: () {
            // Use Navigator.pop to navigate back to the previous screen (home screen)
            Get.back();
          },
        ),
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            children: <Widget>[
              SizedBox(height: 10),
              Container(
                height: 250.0,
                child: Stack(
                  children: [
                    CarouselSlider.builder(
                      carouselController: _carouselController,
                      options: CarouselOptions(
                        height: 250.0,
                        viewportFraction: 1.0,
                        enlargeCenterPage: false,
                        enableInfiniteScroll: false,
                        autoPlay: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentIndex = index;
                          });
                          // Check if it's the last slide and disable sliding
                          if (index == widget.imageAssets.length - 1) {
                            _carouselController.stopAutoPlay();
                          }
                        },
                      ),
                      itemCount: widget.imageAssets.length,
                      itemBuilder: (context, index, realIndex) {
                        final image = widget.imageAssets[index];
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(image, fit: BoxFit.cover),
                        );
                      },
                    ),
                    Positioned(
                      bottom: 10,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                            widget.imageAssets.asMap().entries.map((entry) {
                          int index = entry.key;
                          return Container(
                            width: 8.0,
                            height: 13.0,
                            margin: EdgeInsets.symmetric(horizontal: 4.0),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _currentIndex == index
                                    ? Color.fromARGB(
                                        220, 252, 252, 252) // Active dot color
                                    : Color.fromARGB(137, 171, 171, 171)),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: DetailsSectionWidget(
                  namaKos: widget.namaKos,
                  lokasi: widget.lokasi,
                  rating: widget.rating,
                  deskripsi: widget.deskripsi,
                  ruangan: widget.ruangan,
                  harga: widget.harga,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
