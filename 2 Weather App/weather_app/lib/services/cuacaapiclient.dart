import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/Model/modelcuaca.dart';

class CuacaApiClient {
  Future<Cuaca>? getCurrentWeather(String? location) async {
    var endpoint = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=0054a84de820ae0e5459a1063934747f&units=metric&lang=Id");
    var response = await http.get(endpoint);
    var body = jsonDecode(response.body);
    print(Cuaca.fromJson(body));
    return Cuaca.fromJson(body);
  }
}
