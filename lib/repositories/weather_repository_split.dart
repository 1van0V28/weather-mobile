import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/models/current_weather.dart';
import 'package:weather/models/week_weather.dart';

class WeatherRepositorySplit {
  final String openKey = '371247700e5cfe7af3a8711e0d6ba638';
  final String currentCity;

  WeatherRepositorySplit({
    required this.currentCity,
  });

  Future<CurrentWeather> getCurrentWeather() async {
    final responseCurrent = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$currentCity&lang=ru&appid=$openKey&units=metric'));
    if (responseCurrent.statusCode == 200) {
      return CurrentWeather.fromJson(jsonDecode(responseCurrent.body));
    }
    throw Exception('запрос не прошёл');
  }

  Future<WeekWeather> getWeekWeather() async {
    final responseWeek = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?q=$currentCity&lang=ru&appid=$openKey&units=metric'));
    if (responseWeek.statusCode == 200) {
      return WeekWeather.fromJson(jsonDecode(responseWeek.body));
    }
    throw Exception('запрос не прошёл');
  }
}
