import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/Model/locationmodel.dart';

class DataService {
  Future<Lokasi> FetchEvent(String cityName) async {
    try {
      //https://api.openweathermap.org/data/2.5/weather?id={city id}&appid={API key}
      final queryParameter = {
        'q': cityName,
        'appid': '0054a84de820ae0e5459a1063934747f',
        'units': 'metric',
        'lang': 'Id',
      };
      final uri = Uri.https(
          'api.openweathermap.org', '/data/2.5/weather', queryParameter);
      final Response = await http.get(uri);

      if (Response.statusCode == 200) {
        return Lokasi.fromJson(jsonDecode(Response.body));
      } else {
        throw Exception('fail to load weather');
      }
    } catch (e) {
      rethrow;
    }
  }
}
