import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter1/controller/ForecastController.dart';
import 'package:flutter1/widget/time_picker.dart';
import '../widget/weather_forecast_item.dart';



class HomeMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  final weatherData = [
    WeatherForecastItem(
      date: 'Mon, Feb 24',
      condition: 'Sunny',
      temperature: 22.5,
      iconUrl: 'https://openweathermap.org/img/wn/01d.png',
    ),
    WeatherForecastItem(
      date: 'Tue, Feb 25',
      condition: 'Rainy',
      temperature: 18.0,
      iconUrl: 'https://openweathermap.org/img/wn/10d.png',
    ),
    WeatherForecastItem(
      date: 'Wed, Feb 26',
      condition: 'Cloudy',
      temperature: 20.3,
      iconUrl: 'https://openweathermap.org/img/wn/03d.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TimePickerRow(
          controller: ForecastController(),
          callbackTabPressed: (index) {},
        ),
        Padding(padding: EdgeInsets.only(top: 10)),
        Expanded(child: Container(
          color: Colors.transparent,
          child: ListView.builder(
            itemCount: weatherData.length,
            itemBuilder: (context, index) => weatherData[index],
          ),
        ),)
      ],
    );
  }
}
