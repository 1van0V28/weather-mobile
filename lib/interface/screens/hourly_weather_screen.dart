import 'package:flutter/material.dart';
import 'package:weather/interface/widgets/icon_parameter.dart';
import 'package:weather/models/day_hour_weather.dart';
import 'package:weather_icons/weather_icons.dart';

import 'current_hour_weather_screen.dart';

class HourlyWeather extends StatefulWidget {
  final String title;
  final List<HourWeather> hourlyWeather;

  const HourlyWeather({
    super.key,
    required this.title,
    required this.hourlyWeather,
  });

  String capitalize(String string) {
    return ('${string[0].toUpperCase()}${string.substring(1)}');
  }

  @override
  State<HourlyWeather> createState() => _HourlyWeatherState();
}

class _HourlyWeatherState extends State<HourlyWeather> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        title: Text(widget.title),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(5),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CurrentHourWeather(
                    title: '${widget.title} ${widget.hourlyWeather[index].dt}',
                    hourWeather: widget.hourlyWeather[index],
                  ),
                ),
              );
            },
            child: ListTile(
              tileColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              leading: Image.network(
                "https://openweathermap.org/img/wn/${widget.hourlyWeather[index].weatherIcon}@2x.png",
                fit: BoxFit.fill,
              ),
              title: Text(
                widget.capitalize(widget.hourlyWeather[index].weatherDescription),
                style: const TextStyle(color: Colors.deepOrange, fontSize: 25),
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.hourlyWeather[index].dt,
                    style: const TextStyle(color: Colors.deepPurple, fontSize: 30),
                  ),
                  IconParameter(
                    weatherIcon: WeatherIcons.thermometer,
                    parameter: widget.hourlyWeather[index].temp.toInt(),
                    parameterType: 'C°',
                    iconColor: Colors.black,
                    parameterColor: Colors.deepPurple,
                    parameterSize: 30,
                  ),
                  IconParameter(
                    weatherIcon: WeatherIcons.humidity,
                    parameter: widget.hourlyWeather[index].humidity,
                    parameterType: '',
                    iconColor: Colors.black,
                    parameterColor: Colors.deepPurple,
                    parameterSize: 30,
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 5);
        },
        itemCount: widget.hourlyWeather.length,
      ),
    );
  }
}
