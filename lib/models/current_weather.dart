/// Данные о погоде
class CurrentWeather {
  final String weatherDescription;
  final double mainTemp;
  final double mainFeels;
  final int mainHumidity;
  final String weatherIcon;
  final double windSpeed;

  const CurrentWeather({
    required this.weatherDescription,
    required this.mainTemp,
    required this.mainFeels,
    required this.mainHumidity,
    required this.weatherIcon,
    required this.windSpeed,
  });

  static CurrentWeather fromJson(Map<String, dynamic> json) {
    return CurrentWeather(
      weatherDescription: json['weather'][0]['description'] as String,
      mainTemp: json['main']['temp'] as double,
      mainFeels: json['main']['feels_like'] as double,
      mainHumidity: json['main']['humidity'] as int,
      weatherIcon: json['weather'][0]['icon'] as String,
      windSpeed: json['wind']['speed'] as double,
    );
  }
}
