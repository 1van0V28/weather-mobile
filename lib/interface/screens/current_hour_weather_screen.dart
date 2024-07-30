import 'package:flutter/material.dart';
import 'package:weather/interface/widgets/icon_parameter.dart';
import 'package:weather/interface/widgets/parameters_box.dart';
import 'package:weather/interface/widgets/text_parameter.dart';
import 'package:weather/models/day_hour_weather.dart';
import 'package:weather_icons/weather_icons.dart';

class CurrentHourWeather extends StatefulWidget {
  final String title;
  final HourWeather hourWeather;

  const CurrentHourWeather({
    super.key,
    required this.title,
    required this.hourWeather,
  });

  String capitalize(String string) {
    return ('${string[0].toUpperCase()}${string.substring(1)}');
  }

  @override
  State<CurrentHourWeather> createState() => _CurrentHourWeatherState();
}

class _CurrentHourWeatherState extends State<CurrentHourWeather> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        title: Text(widget.title),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
      ),
      body: Column(
        children: [
          SizedBox(
            width: 200,
            height: 200,
            child: Image.network(
              "https://openweathermap.org/img/wn/${widget.hourWeather.weatherIcon}@2x.png",
              fit: BoxFit.fill,
            ),
          ),
          Text(
            widget.capitalize(widget.hourWeather.weatherDescription),
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          Text(
            '${widget.hourWeather.temp} C°',
            style: const TextStyle(color: Colors.white, fontSize: 75),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              'Ощущается как ${widget.hourWeather.tempFeels} C°',
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          Expanded(
            child: GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(20),
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              crossAxisCount: 2,
              children: [
                ParametersBox(
                  boxTitle: 'Температура',
                  parameterList: [
                    IconParameter(
                      weatherIcon: WeatherIcons.thermometer_exterior,
                      parameter: widget.hourWeather.tempMin,
                      parameterType: 'C°',
                      iconColor: Colors.deepPurple,
                      parameterColor: Colors.black,
                      parameterSize: 35,
                    ),
                    IconParameter(
                      weatherIcon: WeatherIcons.thermometer,
                      parameter: widget.hourWeather.tempMax,
                      parameterType: 'C°',
                      iconColor: Colors.deepPurple,
                      parameterColor: Colors.black,
                      parameterSize: 35,
                    ),
                  ],
                ),
                ParametersBox(
                  boxTitle: 'Осадки',
                  parameterList: [
                    IconParameter(
                      weatherIcon: WeatherIcons.cloudy,
                      parameter: widget.hourWeather.clouds,
                      parameterType: '%',
                      iconColor: Colors.deepPurple,
                      parameterColor: Colors.black,
                      parameterSize: 35,
                    ),
                    IconParameter(
                      weatherIcon: WeatherIcons.sprinkle,
                      parameter: widget.hourWeather.pop,
                      parameterType: '%',
                      iconColor: Colors.deepPurple,
                      parameterColor: Colors.black,
                      parameterSize: 35,
                    ),
                  ],
                ),
                ParametersBox(
                  boxTitle: 'Ветер, м/с',
                  parameterList: [
                    IconParameter(
                      weatherIcon: WeatherIcons.windy,
                      parameter: widget.hourWeather.windSpeed,
                      parameterType: '',
                      iconColor: Colors.deepPurple,
                      parameterColor: Colors.black,
                      parameterSize: 30,
                    ),
                    TextParameter(
                      parameterName: 'Угол',
                      parameter: widget.hourWeather.windDeg,
                      parameterType: '',
                      parameterNameColor: Colors.deepPurple,
                      parameterColor: Colors.black,
                      parameterSize: 25,
                    ),
                    TextParameter(
                      parameterName: 'Порыв',
                      parameter: widget.hourWeather.windGust,
                      parameterType: '',
                      parameterNameColor: Colors.deepPurple,
                      parameterColor: Colors.black,
                      parameterSize: 25,
                    ),
                  ],
                ),
                ParametersBox(
                  boxTitle: 'Давление, мм',
                  parameterList: [
                    IconParameter(
                      weatherIcon: WeatherIcons.barometer,
                      parameter: widget.hourWeather.pressure,
                      parameterType: '',
                      iconColor: Colors.deepPurple,
                      parameterColor: Colors.black,
                      parameterSize: 28,
                    ),
                    TextParameter(
                      parameterName: 'Море',
                      parameter: widget.hourWeather.seaPressure,
                      parameterType: '',
                      parameterNameColor: Colors.deepPurple,
                      parameterColor: Colors.black,
                      parameterSize: 25,
                    ),
                    TextParameter(
                      parameterName: 'Земля',
                      parameter: widget.hourWeather.groundPressure,
                      parameterType: '',
                      parameterNameColor: Colors.deepPurple,
                      parameterColor: Colors.black,
                      parameterSize: 25,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
