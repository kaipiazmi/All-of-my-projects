// home_controller.dart

import 'package:get/get.dart';
import 'package:kos_kosan/model/kosandata_bookmark.dart';

class HomeController extends GetxController {
  final RxList<KosanData> bookmarkedKosan =
      <KosanData>[].obs; // Update the type

  final List<KosanData> allKosan = [
    KosanData(
      namaKos: 'Kos Pak Kaipi',
      rating: '4.9',
      imageAssets: [
        'https://www.idkos.com/images/source/desain-kos-kosan-2-konsep-modern.jpg',
        'https://hotelier.id/wp-content/uploads/2022/03/Cove-Bedroom.jpg',
        'https://techviral.net/wp-content/uploads/2015/08/Selected-Device-To-Connect-To-Your-Wifi-830x450.jpg',
      ],
      harga: '800',
      deskripsi:
          'Selamat datang di halaman detail Kos Pak Kaipi! Berikut adalah fasilitas yang tersedia untuk kenyamanan Anda selama tinggal di kamar ini: \n1. AC\n2. Wifi\n3. Kamar mandi dalam\n4. Kasur untuk 2 orang\n5. Tv\n6. Lemari\n7. Dapur Sendiri\n8. Dekorasi kamar',
      ruangan: '4',
      lokasi: 'Jln Mabar Hilir Pasar 4 Gg Keluarga',
    ),
    KosanData(
      namaKos: 'Kos Pak Andi',
      rating: '4.0',
      imageAssets: [
        'https://events.rumah123.com/news-content/img/2022/01/20115624/Desain-kos-kosan-8-Kamar.jpg',
      ],
      harga: '500',
      deskripsi:
          '   Selamat datang di halaman detail Kos Pak Andi! Berikut adalah fasilitas yang tersedia untuk kenyamanan Anda selama tinggal di kamar ini: \n1. AC\n2. Wifi\n3. Kamar Mandi Dalam\n4. Kasur\n5. Tv\n6. Lemari\n7. Dapur Bersama',
      ruangan: '4',
      lokasi: 'Jln Mabar Hilir Pasar 4 gg mawar',
    ),
    KosanData(
      namaKos: 'Kos Berhantu',
      rating: '3.5',
      imageAssets: [
        'https://gambar.sgp1.digitaloceanspaces.com/wp-content/uploads/2021/07/22163122/viral-penerimaan-kos-kosan-horor-netizen-auto-ngekos-di-rumah-dara51_700.jpg',
      ],
      harga: '100',
      deskripsi:
          '   Selamat datang di halaman detail Kos berhantu! Berikut adalah fasilitas yang tersedia untuk kenyamanan Anda selama tinggal di kamar ini berhantu hanya untuk menginap sambil menguji adrenalin: \n1. Kasur \n2. Lemari\n3. Laci Kecil\n4. Kamar mandi luar',
      ruangan: '1',
      lokasi: 'Jln Lengsir Wangi Pasar 4 no.3',
    ),
    KosanData(
      namaKos: 'Kos Bu Ayana',
      rating: '4.8',
      imageAssets: [
        'https://www.idkos.com/images/source/desain-kos-kosan-yang-sehat.jpg',
      ],
      harga: '900',
      deskripsi:
          '   Selamat datang di halaman detail Kos berhantu! Berikut adalah fasilitas yang tersedia untuk kenyamanan Anda selama tinggal di kamar ini berhantu hanya untuk menginap sambil menguji adrenalin: \n1. Kasur \n2. Lemari\n3. Laci Kecil\n4. Kamar mandi luar',
      ruangan: '2',
      lokasi: 'Jl. Mabar Hilir Pasar 3',
    ),
    KosanData(
      namaKos: 'Kos Pak Sutejo',
      rating: '4.7',
      imageAssets: [
        'https://tokban.com/blog/wp-content/uploads/2022/10/rumah-kost-2-lantai-1.jpg',
      ],
      harga: '500',
      deskripsi:
          '   Selamat datang di halaman detail Kos berhantu! Berikut adalah fasilitas yang tersedia untuk kenyamanan Anda selama tinggal di kamar ini berhantu hanya untuk menginap sambil menguji adrenalin: \n1. Kasur \n2. Lemari\n3. Laci Kecil\n4. Kamar mandi luar',
      ruangan: '4',
      lokasi: 'Jl. Mabar Hilir Gg Kenangan',
    ),
    KosanData(
      namaKos: 'Kos Pak Budi',
      rating: '4.6',
      imageAssets: [
        'https://www.sewakost.com/files/05-2019/ad23174/listing-1089855111_large.jpg',
      ],
      harga: '300',
      deskripsi:
          '   Selamat datang di halaman detail Kos Pak Budi! Berikut adalah fasilitas yang tersedia untuk kenyamanan Anda selama tinggal di kamar ini: \n1. Kamar kosong \n2. Kamar mandi dalam\n3. Dapur Bersama\n4. Rak Sepatu\n5 Tempat sampah\n6 Mesin Cuci ',
      ruangan: '4',
      lokasi: 'Jl. Mabar Hilir Pasar 7',
    ),
    // Add more sample data here...
  ];

  bool isKosanBookmarked(String kosan) {
    return bookmarkedKosan.any((kosanData) => kosanData.namaKos == kosan);
  }

  void toggleBookmark(String kosan) {
    if (isKosanBookmarked(kosan)) {
      bookmarkedKosan.removeWhere((kosanData) => kosanData.namaKos == kosan);
    } else {
      final kosanData =
          allKosan.firstWhere((kosanData) => kosanData.namaKos == kosan);
      bookmarkedKosan.add(kosanData);
    }
  }

  // Variabel Rx untuk menampung data yang ingin dikirim ke DetailScreen
  RxString namaKos = ''.obs;
  RxString rating = ''.obs;
  RxList<String> imageAssets = <String>[].obs;
  RxString harga = ''.obs;
  RxString deskripsi = ''.obs;
  RxString ruangan = ''.obs;
  RxString lokasi = ''.obs;

  // Fungsi untuk mengisi data-data ke variabel Rx
  void setData(
    String namaKos,
    String rating,
    List<String> imageAssets,
    String harga,
    String deskripsi,
    String ruangan,
    String lokasi,
  ) {
    this.namaKos.value = namaKos;
    this.rating.value = rating;
    this.imageAssets.value = imageAssets;
    this.harga.value = harga;
    this.deskripsi.value = deskripsi;
    this.ruangan.value = ruangan;
    this.lokasi.value = lokasi;
  }
}
