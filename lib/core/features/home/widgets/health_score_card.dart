import 'package:flutter/material.dart';
import 'package:reveria/core/theming/colors.dart';

Widget buildRoutineTrackerCard({
  required int hoursTracked,
}) {
  // Logical fake data for activities that are beneficial for Alzheimer's patients
  final routineData = {
    "Sleep": 7,
    "Work/Activity": 5,
    "Exercise": 2,
    "Leisure (Hobby)": 3,
    "Eating/Meals": 3,
    "Mental Exercises": 2,
    "Rest/Break": 2,
  };

  // Calculate remaining hours
  int remainingHours = 24 - hoursTracked;

  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    elevation: 0, // Slight shadow to make the card stand out
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: RadialGradient(
          colors: [
            ColorsManager.primaryColorbackLight.withOpacity(0.01), // Lighter gradient for a softer look
            const Color.fromARGB(255, 200, 203, 255).withOpacity(0.20), // Softer base color
          ],
          center: Alignment.topLeft,
          radius: 1.5, // Adjusted to make the gradient more visible
          
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Routine Tracker",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: ColorsManager.primaryColorTealDark, // Adjusted to primary color for better contrast
              ),
            ),
            const SizedBox(height: 12),
            Text(
              "You've scheduled $hoursTracked out of 24 hours.",
              style: TextStyle(
                fontSize: 16,
                color: ColorsManager.textGray, // Slightly softer color for readability
              ),
            ),
            const SizedBox(height: 12),
            // Motivational or helpful message for Alzheimer’s patients
            if (remainingHours > 4)
              Text(
                "Remember to take breaks and engage in simple activities to maintain cognitive health.",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold,
                ),
              )
            else
              Text(
                "Well done! You are balancing your time well. Keep up the healthy routine!",
                style: TextStyle(
                  fontSize: 14,
                  color: ColorsManager.textTeal,
                  fontWeight: FontWeight.bold,
                ),
              ),
            const SizedBox(height: 12),
            // Simplified display of routine info with larger fonts for easier reading
            _buildSimpleRoutineInfo(routineData),
          ],
        ),
      ),
    ),
  );
}

// Helper to build simplified routine info with larger fonts
Widget _buildSimpleRoutineInfo(Map<String, int> routineData) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      for (var entry in routineData.entries)
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [


                      
              Text(
                entry.key, 
                style:const TextStyle(
                  fontSize: 16,
                  color: ColorsManager.primaryColorTealDark, // Enhanced contrast for activity names
                ),
              ),
              Text(
                "${entry.value} hrs",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: ColorsManager.textTeal, // Highlight color for the hours
                ),
              ),
            ],
          ),
        ),
    ],
  );
}
