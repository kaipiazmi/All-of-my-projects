import 'package:flutter/material.dart';
import 'package:kos_kosan/view/style.dart';
import 'package:get/get.dart';
import 'package:kos_kosan/widgets/homescreen_widgets.dart';
import 'package:kos_kosan/pages/Bookmark.dart';
import 'package:kos_kosan/pages/Detail_Screen.dart';
import 'package:kos_kosan/controllers/home_controller.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final HomeController homeController = Get.put(HomeController());

  void navigateToDetailScreen(
      String namaKos,
      String rating,
      List<String> imageAssets,
      String harga,
      String deskripsi,
      String ruangan,
      String lokasi) {
    homeController.setData(
      namaKos,
      rating,
      imageAssets,
      harga,
      deskripsi,
      ruangan,
      lokasi,
    );
    Get.to(() => DetailScreen(
          title: 'Details',
          namaKos: namaKos,
          rating: rating,
          imageAssets: imageAssets,
          harga: harga,
          deskripsi: deskripsi,
          ruangan: ruangan,
          lokasi: lokasi,
        ));
  }

  void navigateToBookmarkScreen() {
    Get.to(() => BookmarkScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        toolbarHeight: 100, //atur tinggi appbar

        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.menu),
          padding: EdgeInsets.only(left: 30),
          onPressed: () {},
          splashColor: Colors.transparent, // menghilangkan efek ketika ditekan
          highlightColor:
              Colors.transparent, // menghilangkan efek ketika ditekan
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            padding: EdgeInsets.only(right: 30), // Ganti ikon sesuai kebutuhan
            onPressed: () {
              // Tambahkan fungsi untuk menangani aksi ikon di sini
            },
            splashColor:
                Colors.transparent, // menghilangkan efek ketika ditekan
            highlightColor:
                Colors.transparent, // menghilangkan efek ketika ditekan
          ),
        ],

        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.only(top: 50.0, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Lokasi Sekarang',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 20,
                      color: Colors.black,
                    ),
                    SizedBox(height: 10, width: 5),
                    Text(
                      'Mabar Hilir, Medan',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 6.0,
                  horizontal: 10.0,
                ),
                margin: const EdgeInsets.symmetric(
                  horizontal: 10.0, // Atur margin horizontal di sini
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(50.0),
                  ),
                  border: Border.all(
                    width: 1.0,
                    color: Colors.grey[400]!,
                  ),
                ),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.search),
                    ),
                    Expanded(
                      child: TextFormField(
                        initialValue: null,
                        decoration: const InputDecoration.collapsed(
                          filled: true,
                          fillColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          hintText: "Cari Kos-kosan",
                        ),
                        onFieldSubmitted: (value) {},
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 3, bottom: 10),
                child: Row(
                  children: [
                    Text("Kos-kosan di dekatmu",
                        style: AppTextStyles.JudulText),
                    Spacer(),
                    Text(
                      "View All",
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Warna.warna_utama),
                    ),
                  ],
                ),
              ),
              Container(
                height: 250,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    GestureDetector(
                      onTap: () {
                        navigateToDetailScreen(
                          'Kos Pak Kaipi',
                          '4.9',
                          [
                            'https://www.idkos.com/images/source/desain-kos-kosan-2-konsep-modern.jpg',
                            'https://hotelier.id/wp-content/uploads/2022/03/Cove-Bedroom.jpg',
                            'https://techviral.net/wp-content/uploads/2015/08/Selected-Device-To-Connect-To-Your-Wifi-830x450.jpg',
                          ],
                          '800',
                          '   Selamat datang di halaman detail Kos Pak Kaipi! Berikut adalah fasilitas yang tersedia untuk kenyamanan Anda selama tinggal di kamar ini: \n1. AC\n2. Wifi\n3. Kamar mandi dalam\n4. Kasur untuk 2 orang\n5. Tv\n6. Lemari\n7. Dapur Sendiri\n8. Dekorasi kamar',
                          '4',
                          'Jln Mabar Hilir Pasar 4 Gg Keluarga',
                        );
                      },
                      child: Container_Row(
                        context: context,
                        imageAsset:
                            'https://www.idkos.com/images/source/desain-kos-kosan-2-konsep-modern.jpg',
                        namaKos: 'Kos Pak Kaipi',
                        harga: '800',
                        rating: '4.9',
                        deskripsi: '',
                        ruang: '3',
                      ),
                    ),
                    SizedBox(width: 8),
                    GestureDetector(
                      onTap: () {
                        navigateToDetailScreen(
                            'Kos Pak Andi',
                            '4.0',
                            [
                              'https://events.rumah123.com/news-content/img/2022/01/20115624/Desain-kos-kosan-8-Kamar.jpg',
                              'https://cdn-cms.pgimgs.com/static/2021/02/3.4-Desain-Kamar-Kost-Kamar-Mandi-Dalam.png',
                              'https://techviral.net/wp-content/uploads/2015/08/Selected-Device-To-Connect-To-Your-Wifi-830x450.jpg',
                            ],
                            '500',
                            '   Selamat datang di halaman detail Kos Pak Andi! Berikut adalah fasilitas yang tersedia untuk kenyamanan Anda selama tinggal di kamar ini: \n1. AC\n2. Wifi\n3. Kamar Mandi Dalam\n4. Kasur\n5. Tv\n6. Lemari\n7. Dapur Bersama',
                            '4',
                            'Jln Mabar Hilir Pasar 4 gg mawar');
                      },
                      child: Container_Row(
                        context: context,
                        imageAsset:
                            'https://events.rumah123.com/news-content/img/2022/01/20115624/Desain-kos-kosan-8-Kamar.jpg',
                        namaKos: 'Kos Pak Andi',
                        harga: '500',
                        rating: '4.0',
                        deskripsi: '',
                        ruang: '4',
                      ),
                    ),
                    SizedBox(width: 8),
                    GestureDetector(
                      onTap: () {
                        navigateToDetailScreen(
                            'Kos Berhantu',
                            '3.5',
                            [
                              'https://gambar.sgp1.digitaloceanspaces.com/wp-content/uploads/2021/07/22163122/viral-penerimaan-kos-kosan-horor-netizen-auto-ngekos-di-rumah-dara51_700.jpg',
                              'https://ivanwinata.files.wordpress.com/2014/08/img_20140805_233838.jpg',
                              'https://kuyou.id/content/images/fakta-cerita-kamar-kos-berhantu-ciputat-20200917045309.jpg',
                            ],
                            '100',
                            '   Selamat datang di halaman detail Kos berhantu! Berikut adalah fasilitas yang tersedia untuk kenyamanan Anda selama tinggal di kamar ini berhantu hanya untuk menginap sambil menguji adrenalin: \n1. Kasur \n2. Lemari\n3. Laci Kecil\n4. Kamar mandi luar',
                            '1',
                            'Jln Lengsir Wangi Pasar 4 no.3');
                      },
                      child: Container_Row(
                        context: context,
                        imageAsset:
                            'https://gambar.sgp1.digitaloceanspaces.com/wp-content/uploads/2021/07/22163122/viral-penerimaan-kos-kosan-horor-netizen-auto-ngekos-di-rumah-dara51_700.jpg',
                        namaKos: 'Kos Berhantu',
                        harga: '100',
                        rating: '3.5',
                        deskripsi: '',
                        ruang: '1',
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 20.0, left: 3, bottom: 10),
                  child: Row(
                    children: [
                      Text("Rekomendasi Kosan untukmu",
                          style: AppTextStyles.JudulText),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: const Icon(
                          Icons.view_compact,
                          size: 24.0,
                          color: Color.fromARGB(255, 64, 64, 64),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                children: [
                  GestureDetector(
                    onTap: () {
                      // Call the function to navigate to the DetailScreen
                      navigateToDetailScreen(
                        'Kos Bu Ayana',
                        '4.0',
                        [
                          'https://www.idkos.com/images/source/desain-kos-kosan-yang-sehat.jpg',
                          'https://waterbasecoating.com/wp-content/uploads/2017/12/kamar-kos-yang-unik-dan-nyaman-1-1.jpg',
                          'https://awsimages.detik.net.id/content/2013/12/07/10/pool.jpg',
                          'https://techviral.net/wp-content/uploads/2015/08/Selected-Device-To-Connect-To-Your-Wifi-830x450.jpg',
                        ],
                        '900',
                        '   Selamat datang di halaman detail Kos Bu Ayana! Berikut adalah fasilitas yang tersedia untuk kenyamanan Anda selama tinggal di kamar ini: \n1.Kolam renang\n2. AC\n3. Wifi\n4. Kamar mandi dalam\n5. Kasur untuk 2 orang\n6. Tv\n7. Lemari\n8. Dapur Sendiri\n9. Dekorasi kamar',
                        '2',
                        'Jl. Mabar Hilir Pasar 3',
                      );
                    },
                    child: Container_Column(
                      context: context,
                      imageAsset:
                          'https://www.idkos.com/images/source/desain-kos-kosan-yang-sehat.jpg',
                      namaKos: 'Kos Bu Ayana',
                      harga: '900',
                      rating: '4.8',
                      deskripsi: '',
                      ruang: '2',
                    ),
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      // Call the function to navigate to the DetailScreen
                      navigateToDetailScreen(
                        'Kos Pak Sutejo',
                        '4.7',
                        [
                          'https://tokban.com/blog/wp-content/uploads/2022/10/rumah-kost-2-lantai-1.jpg',
                          'https://1.bp.blogspot.com/-ge46lY_BrNo/X0NpHK5lSxI/AAAAAAAAEDM/E33cEIv6T-0ugpl7o0W1CYaqC1p5d7BfgCLcBGAsYHQ/s1600/desain-kamar-kost.jpg',
                        ],
                        '500',
                        '   Selamat datang di halaman detail Kos berhantu! Berikut adalah fasilitas yang tersedia untuk kenyamanan Anda selama tinggal di kamar ini: \n1. Kasur \n2. Lemari\n3. Meja belajar\n4. Rak buku\n5. Kamar mandi luar',
                        '4',
                        'Jl. Mabar Hilir Gg Kenangan',
                      );
                    },
                    child: Container_Column(
                      context: context,
                      namaKos: 'Kos Pak Sutejo',
                      imageAsset:
                          'https://tokban.com/blog/wp-content/uploads/2022/10/rumah-kost-2-lantai-1.jpg',
                      harga: '500',
                      rating: '4.7',
                      deskripsi: '',
                      ruang: '4',
                    ),
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      // Call the function to navigate to the DetailScreen
                      navigateToDetailScreen(
                        'Kos Pak Budi',
                        '4.6',
                        [
                          'https://www.sewakost.com/files/05-2019/ad23174/listing-1089855111_large.jpg',
                          'https://www.sewakost.com/files/06-2020/ad38531/terima-kos-kosan-di-bandung-khusus-putri-dekat-784985843.JPG',
                          'https://rumahberniaga.com/wp-content/uploads/2022/09/IMG_20220614_161401-kecil.jpg',
                        ],
                        '300',
                        '   Selamat datang di halaman detail Kos Pak Budi! Berikut adalah fasilitas yang tersedia untuk kenyamanan Anda selama tinggal di kamar ini: \n1. Kamar kosong \n2. Kamar mandi dalam\n3. Dapur Bersama\n4. Rak Sepatu\n5 Tempat sampah\n6 Mesin Cuci ',
                        '4',
                        'Jl. Mabar Hilir Pasar 7',
                      );
                    },
                    child: Container_Column(
                      context: context,
                      namaKos: 'Kos Pak Budi',
                      imageAsset:
                          'https://www.sewakost.com/files/05-2019/ad23174/listing-1089855111_large.jpg',
                      harga: '300',
                      rating: '4.6',
                      deskripsi: '',
                      ruang: '4',
                    ),
                  ),
                  SizedBox(
                      height:
                          100), // Tambahkan lebih banyak Card_Column sesuai kebutuhan
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
