import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For formatting the date
import 'package:reveria/core/theming/colors.dart';

class WeatherAndDateWidget extends StatelessWidget {
  const WeatherAndDateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the current date
    final String currentDate = DateFormat('EEE, d MMM').format(DateTime.now());

    // Mock weather data
    final String weatherCondition = "Sunny";
    final double temperature = 28.0; // in Celsius

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Display current date
          Text(
            currentDate,
            style: TextStyle(fontSize: 18, color: ColorsManager.textGray),
          ),
          const SizedBox(height: 8),
          
          // Display weather information
          Row(
            children: [
              // Display the weather condition icon (e.g., sunny)
              Icon(
                Icons.wb_sunny,
                color: ColorsManager.primaryColorTeal,
                size: 28,
              ),
              const SizedBox(width: 8),
              // Display the weather condition text and temperature
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    weatherCondition,
                    style:const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: ColorsManager.textTeal,
                    ),
                  ),
                  Text(
                    "${temperature.toString()}°C",
                    style: TextStyle(
                      fontSize: 16,
                      color: ColorsManager.textGray,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
