import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl/intl.dart'; // For formatting the date
import 'package:reveria/core/features/home/widgets/current_date_Wether.dart';
import 'package:reveria/core/features/home/widgets/health_score_card.dart'; // Make sure the health score card is imported
import 'package:reveria/core/helpers/spacing.dart';
import 'package:reveria/core/theming/colors.dart';
import 'package:reveria/core/theming/styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the current date

    // Example reminders list
    final List<String> reminders = [
      "Take medication at 9:00 AM",
      "Doctor's appointment at 3:00 PM",
      "Call Sarah about the meeting"
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: ColorsManager.primaryColorTeal,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              GoogleSignIn googleSignIn = GoogleSignIn();
              googleSignIn.disconnect();
              await FirebaseAuth.instance.signOut();
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/login', (route) => false);
            },
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [ColorsManager.primaryColorbackLight, ColorsManager.primaryColorTealLight],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Current Date
             WeatherAndDateWidget(),
              const SizedBox(height: 8),

              // Overview Section with Card for better structure
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Overview",
                    style: TextStyle(
                        fontSize: 22.sp, fontWeight: FontWeight.bold, color: ColorsManager.textTeal),
                  ),
                  horizontalSpace(20),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "All data",
                        style: TextStyle(fontSize: 14.sp, color: ColorsManager.primaryColorTeal),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Health Score Card
              buildHealthScoreCard(), // This will remain unchanged

              // Reminders Section with Cards for each reminder
              Text(
                "Reminders",
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: ColorsManager.textTeal),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: ListView.builder(
                  itemCount: reminders.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 0, // Removed the shadow
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        tileColor: ColorsManager.primaryColorbackLight,
                        title: Text(
                          reminders[index],
                          style: TextStyle(fontSize: 16.sp),
                        ),
                        leading: const Icon(Icons.alarm, color: ColorsManager.primaryColorTeal),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),

      // Floating Action Button with modern design
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Emergency action
        },
        backgroundColor: ColorsManager.red,
        child: const Icon(Icons.warning),
      ),

      // Bottom Navigation Bar with better selected item color
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.memory), label: "Memory Aid"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
        ],
        currentIndex: 0, // Home is selected
        selectedItemColor: ColorsManager.primaryColorTeal,
        unselectedItemColor: ColorsManager.textGray,
        onTap: (index) {
          // Handle navigation logic here
        },
      ),
    );
  }
}
