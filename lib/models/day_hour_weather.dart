final List<String> months = [
  'Января',
  'Февраля',
  'Марта',
  'Апреля',
  'Мая',
  'Июня',
  'Июля',
  'Августа',
  'Сентября',
  'Октября',
  'Ноября',
  'Декабря',
];

class HourWeather {
  final String dt;
  final double temp;
  final double tempFeels;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int seaPressure;
  final int groundPressure;
  final int humidity;
  final String weatherDescription;
  final String weatherIcon;
  final int clouds;
  final double windSpeed;
  final String windDeg;
  final double windGust;
  final int pop;

  const HourWeather({
    required this.dt,
    required this.temp,
    required this.tempFeels,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.seaPressure,
    required this.groundPressure,
    required this.humidity,
    required this.weatherDescription,
    required this.weatherIcon,
    required this.clouds,
    required this.windSpeed,
    required this.windDeg,
    required this.windGust,
    required this.pop,
  });

  static String getDate(String date, bool dayHour) {
    if (dayHour) {
      String dayNum = date.substring(8, 10);
      dayNum[0] == '0' ? dayNum = dayNum.substring(1) : dayNum;
      String monthNum = months[int.parse(date.substring(5, 7)) - 1];
      return '$dayNum $monthNum';
    }
    String hourNum = date.substring(11, 16);
    return hourNum;
  }

  static int getPressure(int pressure) {
    return (pressure * 0.750064).toInt();
  }

  static int getPop(num pop) {
    return (pop * 100).toInt();
  }

  static HourWeather fromJson(Map<String, dynamic> json, bool dayHour) {
    return HourWeather(
      dt: getDate(json['dt_txt'] as String, dayHour),
      temp: json['main']['temp'] as double,
      tempFeels: json['main']['temp'] as double,
      tempMin: json['main']['temp_min'] as double,
      tempMax: json['main']['temp_max'] as double,
      pressure: getPressure(json['main']['pressure'] as int),
      seaPressure: getPressure(json['main']['sea_level'] as int),
      groundPressure: getPressure(json['main']['grnd_level'] as int),
      humidity: json['main']['humidity'] as int,
      weatherDescription: json['weather'][0]['description'] as String,
      weatherIcon: json['weather'][0]['icon'] as String,
      clouds: json['clouds']['all'] as int,
      windSpeed: json['wind']['speed'] as double,
      windDeg: '${json['wind']['deg'] as int}°',
      windGust: json['wind']['gust'] as double,
      pop: getPop((json['pop'] as num)),
    );
  }
}
