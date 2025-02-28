import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter1/models/city.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/weather_bloc.dart';
import '../../models/DayForecastInformation.dart';
import '../../style.dart';

class TemperatureCircleCard extends StatelessWidget {
  final int temperature = 22;
  final String describe = "Mostly \n Clear";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, HomeState>(
      builder: (context, state) {
        dynamic screenState = state.currentLocationWeatherState;
        return Center(
          child: Card(
            elevation: 4,
            clipBehavior: Clip.hardEdge,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Container(
              color: AppColor.colorBackground,
              height: 220,
              width: 260,
              child: Stack(
                children: [
                  if (!screenState.isLoading)
                    SizedBox(
                      width: double.infinity,
                      child: Stack(
                        children: [
                          Transform.translate(
                            offset: Offset(20, -10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // Add the missing bracket here
                                ShaderMask(
                                  shaderCallback: (Rect bounds) {
                                    return LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.white,
                                        AppColor.colorHighLight,
                                      ],
                                    ).createShader(bounds);
                                  },
                                  child: Text(
                                    "${screenState.currentDataLocation?["current"]["temp_c"]}°",
                                    style: TextStyle(
                                      fontSize: 90,
                                      shadows: [
                                        Shadow(
                                          color: Color(0xFF0A36AD),
                                          offset: Offset(5, 10),
                                          blurRadius: 20,
                                        ),
                                      ],
                                      color: Colors.white,
                                      // Must be white for the gradient to work
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ], // Add the missing bracket here
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(50, 100),
                            child: Row(
                              children: [
                                Text(
                                  "${screenState.currentDataLocation?["current"]["condition"]["text"]}",
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.white70,
                                  ),
                                ),
                                Image.asset("images/sun.png"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    ); // Remove the extra bracket and semicolon here
  }
}

class DetailCircleCard extends StatelessWidget {
  String precipitation = "30%";
  String humidity = "80%";
  String wind = "10km/h";

  DetailCircleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, HomeState>(
      builder: (context, state) {
        CurrentLocationWeatherState screenState =
            state.currentLocationWeatherState;
        if (!screenState.isLoading) {
          return Center(
            child: Card(
              elevation: 4,
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Indicator(
                    "Precipitation",
                    "${screenState.currentDataLocation?["current"]["precip_mm"]} mm",
                  ),
                  Indicator(
                    "Humidity",
                    "${screenState.currentDataLocation?["current"]["humidity"]} %",
                  ),
                  Indicator(
                    "Wind speed",
                    "${screenState.currentDataLocation?["current"]["wind_kph"]} km/h",
                  ),
                ],
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}

class Indicator extends StatelessWidget {
  final String typeIndicator;
  final String valueIndicator;

  final IconData icon = Icons.umbrella_rounded;
  final IconData icon1 = Icons.water_drop;
  final IconData icon2 = Icons.wind_power;

  const Indicator(this.typeIndicator, this.valueIndicator, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 12, bottom: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // Center the column content
        children: [
          Icon(
            icon1, // Using a water droplet icon
            color: Color(0xDA0A3F9A), // Matching the blue color from the image
            size: 24, // Adjust the size to match the design
          ), // Spacing between the icon and percentage
          Text(
            valueIndicator, // The humidity percentage
            style: TextStyle(
              fontSize: 20, // Adjust font size for the percentage
              fontWeight: FontWeight.bold,
              color: Color(0xFF0A3F9A), // Black color for the text
            ),
          ),
          Text(
            typeIndicator, // The label
            style: TextStyle(
              fontSize: 12, // Smaller font size for the label
              color: Colors.blue, // Grey color to match the image
            ),
          ),
        ],
      ),
    );
  }
}

List<DayWeatherForecastInformation> generateForecast() {
  return [
    DayWeatherForecastInformation("09:00", "Sunny", 25),
    DayWeatherForecastInformation("12:00", "Partly Cloudy", 28),
    DayWeatherForecastInformation("15:00", "Cloudy", 27),
    DayWeatherForecastInformation("18:00", "Rainy", 23),
    DayWeatherForecastInformation("21:00", "Clear", 20),
    DayWeatherForecastInformation("00:00", "Clear", 18),
    DayWeatherForecastInformation("03:00", "Cloudy", 17),
  ];
}

// Daily forecast

class DayWeatherForecast extends StatelessWidget {
  final List<DayWeatherForecastInformation> forecast = generateForecast();

  DayWeatherForecast({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Today", // The humidity percentage
                style: TextStyle(
                  fontSize: 14,
                  // Adjust font size for the percentage
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0,
                  decoration: TextDecoration.none,
                  color: Color(0xFF0A3F9A), // Black color for the text
                ),
              ),
              Text(
                "7-Day Forecasts >", // The humidity percentage
                style: TextStyle(
                  fontSize: 14, // Adjust font size for the percentage
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                  color: Colors.lightBlue, // Black color for the text
                ),
              ),
            ],
          ),
          SizedBox(height: 14),
          SizedBox(
            height: 150,
            child: Stack(
              children: [
                ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: forecast.length,
                  itemBuilder: (context, index) {
                    return ContentItemDayForecast(data: forecast[index]);
                  },
                ),
                Positioned(
                  left: 0,
                  top: 0,
                  bottom: 0,
                  child: IgnorePointer(
                    child: ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color(0xFFDBEDFB),
                            Color(0xFFDBEDFB).withAlpha(0),
                          ],
                        ).createShader(bounds);
                      },
                      child: Container(
                        width: 100, // Adjust the width of the fade
                        decoration: BoxDecoration(color: Colors.white),
                      ),
                    ),
                  ),
                ),

                Positioned(
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: IgnorePointer(
                    child: ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color(0xFFDBEDFB).withAlpha(0),
                            Color(0xFFDBEDFB),
                          ],
                        ).createShader(bounds);
                      },
                      child: Container(
                        width: 100, // Adjust the width of the fade
                        decoration: BoxDecoration(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ContentItemDayForecast extends StatelessWidget {
  final DayWeatherForecastInformation data;

  const ContentItemDayForecast({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueAccent,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Container(
        padding: EdgeInsets.only(top: 12, bottom: 12, left: 16, right: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              data.timeStampInHour,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Quicksand',
                // Replace with your desired rounded font family
                decoration: TextDecoration.none, // Remove any text decorations
              ),
            ),
            SizedBox(height: 8),
            Image.asset("images/sun.png", width: 30, height: 30),
            SizedBox(height: 8),
            Text(
              "${data.temperature}°",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Quicksand',
                // Replace with your desired rounded font family
                decoration: TextDecoration.none, // Remove any text decorations
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// City Forecast
List<CityForeCastInformation> generateCityForecast() {
  return [
    CityForeCastInformation(
      name: "Ho Chi Minh City",
      currentStatus: "Cloudy",
      temperature: "25°C",
    ),
    CityForeCastInformation(
      name: "Ho Chi Minh City",
      currentStatus: "Cloudy",
      temperature: "25°C",
    ),
    CityForeCastInformation(
      name: "Ho Chi Minh City",
      currentStatus: "Cloudy",
      temperature: "25°C",
    ),
  ];
}

class CityWeatherForecast extends StatelessWidget {
  final List<CityForeCastInformation> forecast = generateCityForecast();

  CityWeatherForecast({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Other Cities", // The humidity percentage
                style: TextStyle(
                  fontSize: 14,
                  // Adjust font size for the percentage
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0,
                  decoration: TextDecoration.none,
                  color: Color(0xFF0A3F9A), // Black color for the text
                ),
              ),
              Text(
                "+", // The humidity percentage
                style: TextStyle(
                  fontSize: 16, // Adjust font size for the percentage
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                  color: Colors.lightBlue, // Black color for the text
                ),
              ),
            ],
          ),
          SizedBox(height: 14),
          SizedBox(
            height: 100,
            child: Stack(
              children: [
                // ListView.builder(
                //   scrollDirection: Axis.horizontal,
                //   itemCount: forecast.length,
                //   itemBuilder: (context, index) {
                //     return ContentItemCityForecast(data: forecast[index]);
                //   },
                // ),
                PageView(
                  scrollDirection: Axis.horizontal,
                  children:
                      forecast
                          .map((data) => ContentItemCityForecast(data: data))
                          .toList(),
                ),
                Positioned(
                  left: 0,
                  top: 0,
                  bottom: 0,
                  child: IgnorePointer(
                    child: ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color(0xFFDBEDFB),
                            Color(0xFFDBEDFB).withAlpha(0),
                          ],
                        ).createShader(bounds);
                      },
                      child: Container(
                        width: 100, // Adjust the width of the fade
                        decoration: BoxDecoration(color: Colors.white),
                      ),
                    ),
                  ),
                ),

                Positioned(
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: IgnorePointer(
                    child: ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color(0xFFDBEDFB).withAlpha(0),
                            Color(0xFFDBEDFB),
                          ],
                        ).createShader(bounds);
                      },
                      child: Container(
                        width: 100, // Adjust the width of the fade
                        decoration: BoxDecoration(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ContentItemCityForecast extends StatelessWidget {
  final CityForeCastInformation data;

  const ContentItemCityForecast({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueAccent,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Container(
        width: 100,
        padding: EdgeInsets.only(top: 12, bottom: 12, left: 16, right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(
                  data?.name ?? "Ho Chi Minh City",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Quicksand',
                    // Replace with your desired rounded font family
                    decoration:
                        TextDecoration.none, // Remove any text decorations
                  ),
                ),
                Text(
                  data?.currentStatus ?? "asfas",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                    fontFamily: 'Quicksand',
                    // Replace with your desired rounded font family
                    decoration:
                        TextDecoration.none, // Remove any text decorations
                  ),
                ),
              ],
            ),
            Text(
              "${data.temperature}°",
              style: TextStyle(
                color: AppColor.colorSecondOnBackground,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Quicksand',
                // Replace with your desired rounded font family
                decoration: TextDecoration.none, // Remove any text decorations
              ),
            ),
          ],
        ),
      ),
    );
  }
}
