import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kos_kosan/controllers/home_controller.dart';
import 'package:kos_kosan/model/kosandata_bookmark.dart';
import 'package:kos_kosan/view/style.dart';

class BookmarkScreen extends StatefulWidget {
  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          toolbarHeight: 150, //atur tinggi appbar
          centerTitle: true,
          title: Text('Penanda'),
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          actions: [
            IconButton(
              icon: Icon(Icons.notifications),
              padding:
                  EdgeInsets.only(right: 30), // Ganti ikon sesuai kebutuhan
              onPressed: () {
                // Tambahkan fungsi untuk menangani aksi ikon di sini
              },
              splashColor:
                  Colors.transparent, // menghilangkan efek ketika ditekan
              highlightColor:
                  Colors.transparent, // menghilangkan efek ketika ditekan
            ),
          ]),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 28, top: 20, bottom: 10),
            child: Text(
              'Daftar Kosan Ditandai',
              style: AppTextStyles.JudulTextsetting,
            ),
          ),
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: homeController.bookmarkedKosan.length,
                itemBuilder: (context, index) {
                  final KosanData bookmarkedKos =
                      homeController.bookmarkedKosan[index];
                  // Implementasi tampilan item bookmarkedKosan di sini
                  // Anda dapat menggunakan widget ListTile atau Container_Row
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25.0, vertical: 5),
                    child: Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            bookmarkedKos.imageAssets
                                .first, // Use the first image from the list
                            width: 80,
                            height: 100,
                            fit: BoxFit.fill,
                          ),
                        ),
                        title: Text(bookmarkedKos.namaKos),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Text(
                            "Rp${bookmarkedKos.harga}.000/bulan",
                            style: AppTextStyles.paragrafdeskripsi,
                          ),
                        ),
                        trailing: GestureDetector(
                          onTap: () {
                            homeController
                                .toggleBookmark(bookmarkedKos.namaKos);
                          },
                          child: Icon(Icons.delete),
                        ),
                        onTap: () {},
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
