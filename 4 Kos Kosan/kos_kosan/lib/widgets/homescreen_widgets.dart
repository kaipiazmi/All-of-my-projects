import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:kos_kosan/view/style.dart';
import 'package:kos_kosan/controllers/home_controller.dart';

class Container_Row extends StatelessWidget {
  final BuildContext context;
  final String imageAsset;
  final String namaKos;
  final String harga;
  final String rating;
  final String deskripsi;
  final String ruang;

  const Container_Row({
    required this.context,
    required this.imageAsset,
    required this.namaKos,
    required this.harga,
    required this.rating,
    required this.deskripsi,
    required this.ruang,
  });

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find();

    return Obx(() {
      final isBookmarked = homeController.isKosanBookmarked(namaKos);

      return Card(
        color: Color.fromARGB(255, 50, 13, 159),
        elevation: 0, // Menghapus shadow
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide.none,
        ),
        child: Container(
          color: Warna.putih,
          width: 280,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      child: Image.network(
                        imageAsset,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(namaKos, style: AppTextStyles.JudulText),
                              Spacer(),
                              Icon(
                                Icons.star,
                                color: Color.fromARGB(255, 255, 235, 57),
                                size: 20.0,
                              ),
                              SizedBox(width: 2),
                              Text(
                                rating,
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Text(
                                '${harga}K',
                                style: AppTextStyles.subjudul,
                              ),
                              Text(
                                '/bulan',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                              Spacer(),
                              Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Color.fromARGB(255, 204, 228, 255),
                                ),
                                child: Text(
                                  '$ruang ruangan tersisa',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color.fromARGB(255, 35, 111, 224),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ]),
                  )
                ],
              ),
              Positioned(
                top: 8,
                right: 8,
                child: IconButton(
                  icon: Icon(
                    isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                  ),
                  color: isBookmarked
                      ? const Color.fromARGB(255, 255, 235, 57)
                      : Color.fromARGB(199, 255, 255, 255),
                  onPressed: () {
                    homeController.toggleBookmark(namaKos);
                  },
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

//Pemanggilannya

class Container_Column extends StatelessWidget {
  final BuildContext context;
  final String imageAsset;
  final String namaKos;
  final String harga;
  final String rating;
  final String deskripsi;
  final String ruang;

  const Container_Column({
    required this.context,
    required this.imageAsset,
    required this.namaKos,
    required this.harga,
    required this.rating,
    required this.deskripsi,
    required this.ruang,
  });

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find();

    return Obx(() {
      final isBookmarked = homeController.isKosanBookmarked(namaKos);
      return Card(
        color: Color.fromARGB(255, 50, 13, 159),
        elevation: 0, // Menghapus shadow
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide.none,
        ),
        child: Container(
          color: Warna.putih,
          height: 250,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      child: Image.network(
                        imageAsset,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(namaKos, style: AppTextStyles.JudulText),
                              Spacer(),
                              Icon(
                                Icons.star,
                                color: Color.fromARGB(255, 255, 235, 57),
                                size: 20.0,
                              ),
                              SizedBox(width: 2),
                              Text(
                                rating,
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Text(
                                '${harga}K',
                                style: AppTextStyles.subjudul,
                              ),
                              Text(
                                '/bulan',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                              Spacer(),
                              Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Color.fromARGB(255, 204, 228, 255),
                                ),
                                child: Text(
                                  '$ruang ruangan tersisa',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color.fromARGB(255, 35, 111, 224),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ]),
                  )
                ],
              ),
              Positioned(
                top: 8,
                right: 8,
                child: IconButton(
                  icon: Icon(
                    isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                  ),
                  color: isBookmarked
                      ? const Color.fromARGB(255, 255, 235, 57)
                      : const Color.fromARGB(108, 255, 255, 255),
                  onPressed: () {
                    homeController.toggleBookmark(namaKos);
                  },
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
