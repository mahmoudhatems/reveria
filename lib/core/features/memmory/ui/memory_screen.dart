import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reveria/core/theming/colors.dart';
import 'package:reveria/core/theming/styles.dart';

class MemoryAidScreen extends StatelessWidget {
  final String personName = "John Doe"; // Sample name
  final String relationship = "Friend"; // Sample relationship
  final String memoryNote = "We met at the park and had coffee together."; // Sample memory note
  final String imageUrl = "https://via.placeholder.com/150"; // Sample image URL

  const MemoryAidScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Padding(
        padding: EdgeInsets.all(16.h), // Padding for comfortable spacing
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Person's Photo
           
            const SizedBox(height: 20),

            // Person's Details
            Text(
              personName,
              style: TextStyle(
                fontSize: 28.sp, // Larger font size for readability
                fontWeight: FontWeight.bold,
                color: ColorsManager.textTeal,
              ),
            ),
            const SizedBox(height: 8),

            Text(
              relationship,
              style: TextStyle(
                fontSize: 24.sp, // Larger text for relationships
                fontWeight: FontWeight.w500,
                color: ColorsManager.textGray,
              ),
            ),
            const SizedBox(height: 16),

            // Memory Note
            Container(
              padding: EdgeInsets.all(16.h), // Padding for the memory note box
              decoration: BoxDecoration(
                color: ColorsManager.primaryColorbackLight,
                borderRadius: BorderRadius.circular(16.r), // Rounded corners for soft visuals
                border: Border.all(color: ColorsManager.primaryColorTeal, width: 2), // Soft border
              ),
              child: Text(
                memoryNote,
                style: TextStyle(
                  fontSize: 20.sp, // Large font size for easy reading
                  fontStyle: FontStyle.italic,
                  color: ColorsManager.textGray,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),

            // Action Buttons or Navigation
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Action to be performed on tap
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorsManager.primaryColorTeal,
                    padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 24.w),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                  ),
                  child: Text(
                    "Next",
                    style: TextStyle(fontSize: 18.sp),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
