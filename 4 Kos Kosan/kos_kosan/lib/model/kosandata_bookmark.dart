class KosanData {
  final String namaKos;
  final String rating;
  final List<String> imageAssets;
  final String harga;
  final String deskripsi;
  final String ruangan;
  final String lokasi;
  bool isBookmarked; // Add the isBookmarked field

  KosanData({
    required this.namaKos,
    required this.rating,
    required this.imageAssets,
    required this.harga,
    required this.deskripsi,
    required this.ruangan,
    required this.lokasi,
    this.isBookmarked = false, // Set the default value for isBookmarked
  });

  // Method to toggle the bookmark status
  void toggleBookmark() {
    isBookmarked = !isBookmarked;
  }
}
