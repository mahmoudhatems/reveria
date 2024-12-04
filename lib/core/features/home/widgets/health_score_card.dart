import 'package:flutter/material.dart';
import 'package:reveria/core/theming/colors.dart';

Widget buildHealthScoreCard() {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    elevation: 0, // Removed the shadow effect
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [
            ColorsManager.primaryColorbackLight, // Light gradient color
            Color.fromARGB(255, 209, 213, 248), // Base color
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
        // Removed boxShadow for no shadow effect
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Health Score",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: ColorsManager.textTeal,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Based on your overview health tracking, your score is 78 and considered good.",
                    style: TextStyle(
                      fontSize: 14,
                      color: ColorsManager.textGray,
                    ),
                  ),
                  const SizedBox(height: 12),
                  GestureDetector(
                    onTap: () {
                      // Add action here
                    },
                    child: Row(
                      children: [
                        Text(
                          "Tell me more",
                          style: TextStyle(
                            color: ColorsManager.primaryColorTeal,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Icon(Icons.arrow_forward,
                            size: 16, color: ColorsManager.primaryColorTeal),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
                // Removed boxShadow for no shadow effect
              ),
              child: CircleAvatar(
                radius: 32,
                backgroundColor: ColorsManager.primaryColorpink,
                child: Text(
                  "78",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
