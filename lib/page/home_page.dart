import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter1/blocs/weather_bloc.dart';
import 'package:flutter1/widget/home_ui_utils/top_components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widget/home_ui_utils/home_components.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherBloc()..add(LoadInitialDataEvent()),
      child: BlocBuilder<WeatherBloc, HomeState>(
        builder: (context, state) {
          return Container(
            color: Color(0xFFDBEDFB),
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TopHomeScreen(),
                      TemperatureCircleCard(),
                      Container(
                        padding: EdgeInsets.all(16.0),
                        child: DetailCircleCard(),
                      ),
                      DayWeatherForecast(),
                      CityWeatherForecast(),
                    ],
                  ),
                ],
              ),
            ),
          );
          // return SizedBox(
          //
          // );
        },
      ),
    );
  }
}
