import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:package_info_plus/package_info_plus.dart'; // Import the package
import 'package:reveria/core/theming/colors.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  // Function to get app version information
  Future<String> _getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return '${packageInfo.appName} v${packageInfo.version}';
  }

  // Function to handle sign-out logic
  void _signOut(BuildContext context) {
    // Your sign-out logic here (e.g., clearing user session, navigating to login screen)
    Navigator.of(context).pushReplacementNamed('/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(24.h),
        child: ListView(
          children: [
            // Header Section
            const Text(
              'Personal Settings',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: ColorsManager.primaryColorTealDark,
              ),
            ),
            const SizedBox(height: 32),

            // User Profile Section
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.account_circle, color: ColorsManager.primaryColorTeal, size: 36),
              title: const Text(
                'Profile',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: ColorsManager.primaryColorTeal,
                ),
              ),
              subtitle: const Text(
                'Update your personal information',
                style: TextStyle(fontSize: 14, color: ColorsManager.textGray),
              ),
              trailing: Icon(Icons.arrow_forward, color: ColorsManager.primaryColorTeal, size: 30),
              onTap: () {
                // Navigate to profile edit page
              },
            ),
            const SizedBox(height: 30),

            // Change Password Section
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.lock, color: ColorsManager.primaryColorTeal, size: 36),
              title: const Text(
                'Change Password',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: ColorsManager.primaryColorTeal,
                ),
              ),
              subtitle: const Text(
                'Update your password for security',
                style: TextStyle(fontSize: 14, color: ColorsManager.textGray),
              ),
              trailing: Icon(Icons.arrow_forward, color: ColorsManager.primaryColorTeal, size: 30),
              onTap: () {
                // Navigate to password change page
              },
            ),
            const SizedBox(height: 32),

            // Notification Settings Section
            const Text(
              'Notification Settings',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: ColorsManager.primaryColorTealDark,
              ),
            ),
            const SizedBox(height: 16),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.notifications, color: ColorsManager.primaryColorTeal, size: 36),
              title: const Text(
                'Push Notifications',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: ColorsManager.primaryColorTeal,
                ),
              ),
              subtitle: const Text(
                'Enable/Disable notifications',
                style: TextStyle(fontSize: 14, color: ColorsManager.textGray),
              ),
              trailing: Switch(
                value: true, // Toggle value
                onChanged: (bool value) {
                  // Handle toggle logic here
                },
                activeColor: ColorsManager.primaryColorTeal,
                activeTrackColor: ColorsManager.primaryColorTealLight,
                inactiveThumbColor: ColorsManager.textGray,
              ),
            ),
            const SizedBox(height: 32),

            // Dark Mode Section
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.brightness_6, color: ColorsManager.primaryColorTeal, size: 36),
              title: const Text(
                'Dark Mode',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: ColorsManager.primaryColorTeal,
                ),
              ),
              subtitle: const Text(
                'Switch to dark theme',
                style: TextStyle(fontSize: 14, color: ColorsManager.textGray),
              ),
              trailing: Switch(
                value: false, // Toggle value
                onChanged: (bool value) {
                  // Handle toggle logic here
                },
                activeColor: ColorsManager.primaryColorTeal,
                activeTrackColor: ColorsManager.primaryColorTealLight,
                inactiveThumbColor: ColorsManager.textGray,
              ),
            ),
            const SizedBox(height: 32),

            // Language Settings Section
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.language, color: ColorsManager.primaryColorTeal, size: 36),
              title: const Text(
                'Language',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: ColorsManager.primaryColorTeal,
                ),
              ),
              subtitle: const Text(
                'Select your preferred language',
                style: TextStyle(fontSize: 14, color: ColorsManager.textGray),
              ),
              trailing: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton<String>(
                  dropdownColor: ColorsManager.white,
                  
                  underline: const SizedBox(),
                  value: 'English', // Default language
                  icon: Icon(Icons.arrow_drop_down, color: ColorsManager.primaryColorTeal),
                  items: ['English', 'Español', 'Français', 'عربي']
                      .map((language) => DropdownMenuItem(
                            value: language,
                            child: Text(language),
                          ))
                      .toList(),
                  onChanged: (String? value) {
                    // Handle language selection
                  },
                ),
              ),
            ),
            const SizedBox(height: 32),

            // About Section
            const Text(
              'About',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: ColorsManager.primaryColorTealDark,
              ),
            ),
            const SizedBox(height: 16),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.info, color: ColorsManager.primaryColorTeal, size: 36),
              title: const Text(
                'App Information',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: ColorsManager.primaryColorTeal,
                ),
              ),
              subtitle: FutureBuilder<String>(
                future: _getAppVersion(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Text(
                      'Loading...',
                      style: TextStyle(fontSize: 14, color: ColorsManager.textGray),
                    );
                  } else if (snapshot.hasError) {
                    return const Text(
                      'Error fetching version',
                      style: TextStyle(fontSize: 14, color: ColorsManager.textGray),
                    );
                  } else {
                    return Text(
                      snapshot.data!,
                      style: const TextStyle(fontSize: 14, color: ColorsManager.textGray),
                    );
                  }
                },
              ),
              trailing: Icon(Icons.arrow_forward, color: ColorsManager.primaryColorTeal, size: 30),
              onTap: () {
                // Navigate to app info page if needed
              },
            ),
            const SizedBox(height: 32),

            // Sign Out Section
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.logout, color: ColorsManager.red, size: 36),
              title: const Text(
                'Sign Out',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: ColorsManager.red,
                ),
              ),
              subtitle: const Text(
                'Log out from your account',
                style: TextStyle(fontSize: 14, color: ColorsManager.textGray),
              ),
              onTap: () => _signOut(context),
            ),
          ],
        ),
      ),
    );
  }
}
