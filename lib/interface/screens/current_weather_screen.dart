import 'package:flutter/material.dart';
import 'package:weather/interface/screens/hourly_weather_screen.dart';
import 'package:weather/interface/widgets/icon_parameter.dart';
import 'package:weather/models/weather_info.dart';
import 'package:weather_icons/weather_icons.dart';

class CurrentWeather extends StatefulWidget {
  final WeatherInfo weatherInfo;

  const CurrentWeather({
    super.key,
    required this.weatherInfo,
  });

  String capitalize(String string) {
    return ('${string[0].toUpperCase()}${string.substring(1)}');
  }

  @override
  State<CurrentWeather> createState() => _CurrentWeatherState();
}

class _CurrentWeatherState extends State<CurrentWeather> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 200,
          height: 200,
          child: Image.network(
            'https://openweathermap.org/img/wn/${widget.weatherInfo.currentWeather.weatherIcon}@2x.png',
            fit: BoxFit.fill,
          ),
        ),
        Text(
          widget.capitalize(widget.weatherInfo.currentWeather.weatherDescription),
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
        Text(
          '${widget.weatherInfo.currentWeather.mainTemp.toInt()} C°',
          style: const TextStyle(color: Colors.white, fontSize: 100),
        ),
        Text(
          'Ощущается как ${widget.weatherInfo.currentWeather.mainFeels.toInt()} C°',
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconParameter(
              weatherIcon: WeatherIcons.windy,
              parameter: widget.weatherInfo.currentWeather.windSpeed,
              parameterType: 'м/с',
              iconColor: Colors.white,
              parameterColor: Colors.white,
              parameterSize: 25,
            ),
            const SizedBox(width: 15),
            IconParameter(
              weatherIcon: WeatherIcons.humidity,
              parameter: widget.weatherInfo.currentWeather.mainHumidity,
              parameterType: '',
              iconColor: Colors.white,
              parameterColor: Colors.white,
              parameterSize: 25,
            ),
          ],
        ),

        /// Список прогноза погоды по дням
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.all(30),
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              /// dayNum для получения списка погоды
              String dayNum = widget.weatherInfo.weekWeather.weekMidWeather[index].dt.split(' ')[0];

              /// Элементы списка
              return InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => HourlyWeather(
                        title: 'Погода ${widget.weatherInfo.weekWeather.weekMidWeather[index].dt}',
                        hourlyWeather: widget.weatherInfo.weekWeather.weekHourWeather[dayNum]!,
                      ),
                    ),
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.weatherInfo.weekWeather.weekMidWeather[index].dt,
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    const SizedBox(height: 35),

                    /// Прогноз на день
                    Expanded(
                      child: Container(
                        width: (MediaQuery.of(context).size.width - 90) / 2,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.white),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 100,
                              height: 100,
                              child: Image.network(
                                "https://openweathermap.org/img/wn/${widget.weatherInfo.weekWeather.weekMidWeather[index].weatherIcon}@2x.png",
                                fit: BoxFit.fill,
                              ),
                            ),
                            Text(
                              widget
                                  .capitalize(widget.weatherInfo.weekWeather.weekMidWeather[index].weatherDescription),
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: Colors.deepOrange, fontSize: 15),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconParameter(
                                    weatherIcon: WeatherIcons.thermometer,
                                    parameter: widget.weatherInfo.weekWeather.weekMidWeather[index].temp.toInt(),
                                    parameterType: 'C°',
                                    iconColor: Colors.black,
                                    parameterColor: Colors.deepPurple,
                                    parameterSize: 25),
                                const SizedBox(width: 5),
                                IconParameter(
                                  weatherIcon: WeatherIcons.humidity,
                                  parameter: widget.weatherInfo.weekWeather.weekMidWeather[index].humidity,
                                  parameterType: '',
                                  iconColor: Colors.black,
                                  parameterColor: Colors.deepPurple,
                                  parameterSize: 25,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(width: 30);
            },
            itemCount: widget.weatherInfo.weekWeather.weekMidWeather.length,
          ),
        ),
      ],
    );
  }
}
