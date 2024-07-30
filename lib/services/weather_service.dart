import 'package:weather/models/weather_info.dart';
import 'package:weather/repositories/weather_repository_split.dart';

class WeatherService {
  Future<WeatherInfo> getWeatherInfo(String currentCity) async {
    WeatherRepositorySplit weatherRepository2 = WeatherRepositorySplit(currentCity: currentCity);
    final currentWeather = await weatherRepository2.getCurrentWeather();
    final weekWeather = await weatherRepository2.getWeekWeather();
    return WeatherInfo(currentWeather: currentWeather, weekWeather: weekWeather);
  }
}
