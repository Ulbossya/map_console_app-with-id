import 'dart:io';

import 'package:map_console_app/weather_api_client.dart';

void main(List<String> arguments) async {
  if (arguments.length != 1) {
    print('Syntax error: dart bin/main.dart <city>');
    return;
  }

  final cityName = arguments.first;

  final cityApiClient = CityApiClient();

  try {
    final currentCity = await cityApiClient.getCityName(cityName);
    for (var city in currentCity){
       print('Data about city $cityName');
       print(city);
       print('---------------------------\n');

    }
    print('Enter the Place ID');
    final placeId = stdin.readLineSync();

    if (placeId != null) {
  final cityDetails = await cityApiClient.getCityDetails(placeId);
  print('City Details with id:');
  print(cityDetails);
} else {
  print('Invalid Place ID.Enter a valid Place ID.');
}
  } on SocketException catch (_) {
    print('Could not fetch current info of city. Check your internet connection!');
  } catch (e) {
    print(e);
  }
}
