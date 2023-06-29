class Cuaca {
  String? cityName;
  int? temp;
  double? wind;
  int? humidity;
  double? feels_like;
  int? pressure;
  String? deskripsi;
  String? iconCode;

  Cuaca(
      {this.cityName,
      this.temp,
      this.wind,
      this.humidity,
      this.feels_like,
      this.pressure,
      this.deskripsi,
      this.iconCode});

  //fungsi
  Cuaca.fromJson(Map<String, dynamic> json) {
    cityName = json["name"];
    temp = json["main"]["temp"].toInt();
    wind = json["wind"]["speed"];
    pressure = json["main"]["pressure"];
    humidity = json["main"]["humidity"];
    feels_like = json["main"]["feels_like"];
    deskripsi = json["weather"][0]["description"];
    iconCode = json["weather"][0]["icon"];
  }
}
