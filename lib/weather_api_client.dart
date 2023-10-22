import 'dart:convert';
import 'package:map_console_app/weather.dart';
import 'package:http/http.dart' as http;

import 'config.dart';

class CityApiClient {
  Future<List<City>> getCityName(String cityName) async {
 // https://maps.googleapis.com/maps/api/place/autocomplete/json?input=Man&language=pt_BR&types=%28cities%29&key=AIzaSyDSc3bK2uacejfepEMiJlrVw9DFC8WVonI
    final url =
        '${Config().baseUrl}$cityName${Config().currentUrl}${Config().apiKey}';
    print(url);

    final response = await http.get(Uri.parse(url));

    if (response.statusCode != 200) {
      print('Request failed with status: ${response.statusCode}');
      throw Exception('Error getting  for $cityName');
    }

    final Map<String, dynamic> jsonResponse =
        Map.castFrom(jsonDecode(response.body));

    if (jsonResponse.isEmpty) {
      throw Exception('Data about $cityName not found');
    }
List<City> list  = [];
 final  predictions = jsonResponse['predictions'];
  for (var prediction in predictions) {
    list.add(City.fromJson(prediction));
}
    return list;

  }
  Future<CityDetails_with_id> getCityDetails(String placeId) async {
    final url = 'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=${Config().apiKey}';
    final response = await http.get(Uri.parse(url));

  if (response.statusCode != 200) {
    throw Exception('Error getting city details with id for Place ID: $placeId');
  }

  final Map<String, dynamic> jsonResponse = jsonDecode(response.body);

  if (jsonResponse.isEmpty) {
    throw Exception('City details not found for Place ID: $placeId');
  }

  return CityDetails_with_id.fromJson(jsonResponse);
}


}


class WeatherApiException implements Exception{
  final String message;
 WeatherApiException(this.message);
}





 






