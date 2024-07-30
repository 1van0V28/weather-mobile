import 'package:flutter/material.dart';
import 'package:weather/interface/screens/current_weather_screen.dart';
import 'package:weather/services/weather_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _newCity;
  late WeatherService _weatherService;

  @override
  void initState() {
    super.initState();
    _weatherService = WeatherService();
    _newCity = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
        backgroundColor: Colors.white,
        title: SizedBox(
          width: MediaQuery.of(context).size.width - 50,
          height: 30,
          child: TextField(
            controller: _newCity,
            decoration: const InputDecoration(
              icon: Icon(
                Icons.place_outlined,
                size: 30,
              ),
            ),
            onChanged: (text) {
              _newCity.text = text;
              setState(() {});
            },
          ),
        ),
      ),
      body: Center(
        child: FutureBuilder(
          key: UniqueKey(),
          future: _weatherService.getWeatherInfo(_newCity.text),
          builder: (context, data) {
            if (data.hasData) {
              return CurrentWeather(weatherInfo: data.data!);
            }
            if (data.hasError) {
              return const Center(
                child: Text('Ничего не найдено'),
              );
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
