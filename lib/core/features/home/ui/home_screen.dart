import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:reveria/core/features/home/widgets/current_date_Wether.dart';
import 'package:reveria/core/features/home/widgets/health_score_card.dart';
import 'package:reveria/core/features/memmory/ui/memory_screen.dart';
import 'package:reveria/core/features/setting/ui/setting_screen.dart';
import 'package:reveria/core/helpers/spacing.dart';
import 'package:reveria/core/theming/colors.dart';
import 'package:reveria/core/widgets/custom_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeTab(),
    MemoryAidScreen(),
    const SettingScreen(),
  ];

  /// Handles the emergency action by displaying a confirmation dialog.
  void _handleEmergency() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Emergency Assistance'),
        content: const Text(
          'This action will notify your caregiver or emergency services. Do you want to proceed?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Cancel',
              style: TextStyle(color: ColorsManager.primaryColorTealDark),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _triggerEmergencyCall();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorsManager.red,
            ),
            child: const Text(
              'Proceed',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  /// Simulates triggering an emergency call or notification.
  void _triggerEmergencyCall() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Emergency assistance triggered.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: _getAppBarTitle(),
        profilePreviewContent: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mahmoud Hatem',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: ColorsManager.textTeal,
              ),
            ),
            SizedBox(height: 8.h),
            GestureDetector(
              onTap: () {
                // Add navigation to the profile screen if needed.
              },
              child: Text(
                'View Profile',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: ColorsManager.primaryColorTealDark,
                ),
              ),
            ),
          ],
        ),
      ),
      body: _screens[_currentIndex],
      floatingActionButton: _currentIndex == 0
          ? FloatingActionButton(
              onPressed: _handleEmergency,
              tooltip: 'Emergency Assistance',
              backgroundColor: ColorsManager.red,
              child: const Icon(Icons.warning),
            )
          : null,
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  /// Determines the app bar title based on the current tab.
  String _getAppBarTitle() {
    switch (_currentIndex) {
      case 0:
        return "Home";
      case 1:
        return "Memory Aid";
      case 2:
        return "Settings";
      default:
        return "Reveria";
    }
  }

  /// Builds the bottom navigation bar.
  Widget _buildBottomNavigationBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: GNav(
        gap: 8,
        backgroundColor: Colors.white,
        color: ColorsManager.textGray,
        activeColor: ColorsManager.primaryColorTeal,
        tabBackgroundColor: ColorsManager.primaryColorbackLight,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
        tabs: const [
          GButton(icon: Icons.home, text: 'Home'),
          GButton(icon: Icons.lightbulb, text: 'Memory Aid'),
          GButton(icon: Icons.settings, text: 'Settings'),
        ],
        selectedIndex: _currentIndex,
        onTabChange: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {

   int _currentGlasses = 0;
  final int _dailyGoal = 8;

  /// Increments the water intake counter.
  void _addWaterGlass() {
    if (_currentGlasses < _dailyGoal) {
      setState(() {
        _currentGlasses++;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Daily water intake goal reached!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final reminders = [
      "Take medication at 9:00 AM",
      "Doctor's appointment at 3:00 PM",
      "Call Hatem about the meeting",
    ];
return SafeArea(
    child: SingleChildScrollView(
      padding: EdgeInsets.all(16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const WeatherAndDateWidget(),
          verticalSpace(10),
          _buildOverviewHeader(),
          const SizedBox(height: 16),
          buildRoutineTrackerCard(hoursTracked: 15),
          const SizedBox(height: 16),
          _buildWaterIntakeTracker(),
          const SizedBox(height: 16),
          _buildStepCounter(),
          const SizedBox(height: 16),
          _buildMoodTracker(),
          const SizedBox(height: 16),
          _buildDietarySuggestions(),
          const SizedBox(height: 16),
          _buildMedicationReminder(),
          const SizedBox(height: 16),
        ],
      ),
    ),
  );
  }

  Widget _buildOverviewHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Overview",
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
            color: ColorsManager.textTeal,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            "All data",
            style: TextStyle(
              fontSize: 14.sp,
              color: ColorsManager.primaryColorTeal,
            ),
          ),
        ),
      ],
    );
  }
Widget _buildWaterIntakeTracker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Water Intake",
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: ColorsManager.textTeal,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "$_currentGlasses/$_dailyGoal glasses",
              style: TextStyle(fontSize: 16.sp, color: ColorsManager.textGray),
            ),
            TextButton(
              onPressed: _addWaterGlass,
              child: Text(
                "Add Glass",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: ColorsManager.primaryColorTeal,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

Widget _buildStepCounter() {
  int _currentSteps = 4000; // Replace with actual step tracking logic.
  int _dailyStepGoal = 10000;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Step Counter",
        style: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          color: ColorsManager.textTeal,
        ),
      ),
      const SizedBox(height: 8),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$_currentSteps/$_dailyStepGoal steps",
            style: TextStyle(fontSize: 16.sp, color: ColorsManager.textGray),
          ),
          ElevatedButton(
            onPressed: () {
              // Integrate actual step tracker.
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Step tracking coming soon!")),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorsManager.primaryColorTeal,
            ),
            child: Text(
              "View Details",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    ],
  );
}
Widget _buildMoodTracker() {
  String _currentMood = "Happy"; // Replace with mood tracking logic.

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Mood Tracker",
        style: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          color: ColorsManager.textTeal,
        ),
      ),
      const SizedBox(height: 8),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Current Mood: $_currentMood",
            style: TextStyle(fontSize: 16.sp, color: ColorsManager.textGray),
          ),
          TextButton(
            onPressed: () {
              // Open a dialog or navigation for mood selection.
            },
            child: Text(
              "Log Mood",
              style: TextStyle(
                fontSize: 14.sp,
                color: ColorsManager.primaryColorTeal,
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
Widget _buildDietarySuggestions() {
  final suggestions = [
    "Drink a glass of water before every meal.",
    "Include more greens in your diet.",
    "Limit sugar intake to stay energized."
  ];

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Dietary Suggestions",
        style: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          color: ColorsManager.textTeal,
        ),
      ),
      const SizedBox(height: 8),
      ListView.builder(
        shrinkWrap: true,
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            padding: EdgeInsets.all(8.r),
            decoration: BoxDecoration(
              color: ColorsManager.primaryColorbackLight,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Text(
              suggestions[index],
              style: TextStyle(fontSize: 16.sp, color: ColorsManager.textGray),
            ),
          );
        },
      ),
    ],
  );
}
Widget _buildMedicationReminder() {
  final medications = [
    {"name": "Vitamin D", "time": "8:00 AM"},
    {"name": "Blood Pressure Pills", "time": "2:00 PM"},
  ];

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Medication Reminder",
        style: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          color: ColorsManager.textTeal,
        ),
      ),
      const SizedBox(height: 8),
      ListView.builder(
        shrinkWrap: true,
        itemCount: medications.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            decoration: BoxDecoration(
              color: ColorsManager.primaryColorbackLight,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: ListTile(
              title: Text(
                medications[index]["name"]!,
                style: TextStyle(fontSize: 16.sp),
              ),
              subtitle: Text(
                medications[index]["time"]!,
                style: TextStyle(fontSize: 14.sp, color: ColorsManager.textGray),
              ),
              leading: const Icon(
                Icons.medical_services,
                color: ColorsManager.primaryColorTeal,
              ),
            ),
          );
        },
      ),
    ],
  );
}
Widget _buildHealthScoreSummary() {
  int _healthScore = 85; // Example score.

  return Container(
    padding: EdgeInsets.all(16.r),
    decoration: BoxDecoration(
      color: ColorsManager.primaryColorbackLight,
      borderRadius: BorderRadius.circular(16.r),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Health Score",
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: ColorsManager.textTeal,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "Your health score today: $_healthScore",
          style: TextStyle(fontSize: 16.sp, color: ColorsManager.textGray),
        ),
      ],
    ),
  );
}



  Widget _buildRemindersSection(List<String> reminders) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Reminders",
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: ColorsManager.textTeal,
          ),
        ),
        const SizedBox(height: 8),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: reminders.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              decoration: BoxDecoration(
                color: ColorsManager.primaryColorbackLight,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: ListTile(
                title: Text(
                  reminders[index],
                  style: TextStyle(fontSize: 16.sp),
                ),
                leading: const Icon(
                  Icons.alarm,
                  color: ColorsManager.primaryColorTeal,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
