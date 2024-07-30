import 'package:weather/models/day_hour_weather.dart';

class WeekWeather {
  final List<HourWeather> weekMidWeather;
  final Map<String, List<HourWeather>> weekHourWeather;

  const WeekWeather({
    required this.weekMidWeather,
    required this.weekHourWeather,
  });

  /// почему-то при сравнивании строк возвращает всегда false
  static bool isMidday(String nowDate) {
    String nowHour = nowDate.substring(11, 13);
    if (nowHour == '12') {
      return true;
    }
    return false;
  }

  static String getDay(String nowDate) {
    String nowDay = nowDate.substring(8, 10);
    nowDay[0] == '0' ? nowDay = nowDay.substring(1) : nowDay;
    return nowDay;
  }

  static WeekWeather fromJson(Map<String, dynamic> json) {
    List<HourWeather> weekMidWeather = [];
    Map<String, List<HourWeather>> weekHourWeather = {};
    for (int index = 0; index < json['list'].length; index++) {
      String dayNum = getDay(json['list'][index]['dt_txt']);

      /// если это погода на середину дня, то добавляем в weekMidWeather
      if (isMidday(json['list'][index]['dt_txt'])) {
        weekMidWeather.add(HourWeather.fromJson(json['list'][index], true));
      }

      /// проверяем на существование ключа в словаре hourDayWeather
      if (weekHourWeather.containsKey(dayNum)) {
        weekHourWeather[dayNum]!.add(HourWeather.fromJson(json['list'][index], false));
      } else {
        weekHourWeather[dayNum] = [HourWeather.fromJson(json['list'][index], false)];
      }
    }

    return WeekWeather(weekMidWeather: weekMidWeather, weekHourWeather: weekHourWeather);
  }
}
