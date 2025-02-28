import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter1/blocs/weather_bloc.dart';
import 'package:flutter1/networks/api_client.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopHomeScreen extends StatelessWidget {
  TopHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, HomeState>(
      builder: (context, state) {
        dynamic screenState = state.currentLocationWeatherState;
        if (screenState.isLoading) {
          return Center(
            child: SizedBox(
              child: Stack(children: [Container(color: Colors.white)]),
            ),
          );
        } else {
          Map<String, dynamic> response = screenState.currentDataLocation!;
          return SizedBox(
            child: Container(
              padding: EdgeInsets.all(16.0),
              // Background color similar to the image
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_pin, // Location pin icon
                        color: Color(0xFF24448F),
                        // Match the blue color in the image
                        size: 24.0,
                      ),
                      SizedBox(width: 8.0), // Space between icon and text
                      Text(
                        response['location']['name'] ?? "Ha Noi",
                        style: TextStyle(
                          fontSize: 24.0,

                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.bold,
                          color: Color(
                            0xFF24448F,
                          ), // Match the text color in the image
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  // Space between "Location" and date/time
                  Text(
                    response['location']['localtime'] ??
                        'Monday, 1 January 10:00',
                    style: TextStyle(
                      fontSize: 16.0,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w100,
                      fontStyle: FontStyle.normal,
                      color:
                          Colors.lightBlue, // Lighter text color for date/time
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
