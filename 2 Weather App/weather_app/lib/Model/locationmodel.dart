class Lokasi {
  String? name;
  String? deskripsi;
  String? icon;
  int? temp;
  double? wind;
  int? humidity;
  int? feels_like;
  int? pressure;

  Lokasi({
    this.name = '',
    this.deskripsi = '',
    this.icon = '',
    this.temp = 0,
    this.wind = 0,
    this.humidity = 0,
    this.feels_like = 0,
    this.pressure = 0,
  });

  //fungsi
  factory Lokasi.fromJson(Map<String, dynamic> json) {
    return Lokasi(
      name: json['name'] ?? '',
      deskripsi: json['weather'][0]['description'] ?? '',
      icon: json['weather'][0]['icon'] ?? '',
      temp: json['main']['temp']?.toInt(),
      wind: json['wind']['speed']?.toDouble() ?? 0,
      humidity: json["main"]["humidity"]?.toInt(),
      feels_like: json["main"]["feels_like"]?.toInt(),
      pressure: json["main"]["pressure"]?.toInt(),
    );
  }
}
