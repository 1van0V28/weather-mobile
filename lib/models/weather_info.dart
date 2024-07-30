import 'package:weather/models/current_weather.dart';
import 'package:weather/models/week_weather.dart';

class WeatherInfo {
  final CurrentWeather currentWeather;
  final WeekWeather weekWeather;

  const WeatherInfo({required this.currentWeather, required this.weekWeather});
}
