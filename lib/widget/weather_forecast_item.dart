

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeatherForecastItem extends StatelessWidget {
  final String date;
  final String condition;
  final double temperature;
  final String iconUrl; // URL for weather icon (e.g., from an API like OpenWeatherMap)

  const WeatherForecastItem({
    Key? key,
    required this.date,
    required this.condition,
    required this.temperature,
    required this.iconUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        leading: Image.network(
          iconUrl,
          width: 50,
          height: 50,
          errorBuilder: (context, error, stackTrace) {
            return const Icon(Icons.cloud_off); // Fallback if image fails to load
          },
        ),
        title: Text(
          date,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(condition),
        trailing: Text(
          '${temperature.toStringAsFixed(1)}°C',
          style: const TextStyle(fontSize: 18, color: Colors.blue),
        ),
      ),
    );
  }
}