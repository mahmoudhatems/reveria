
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reveria/core/features/login/widgets/app_logo_and_name.dart';
import 'package:reveria/core/features/onboarding/widgets/dr_image_and_text.dart';
import 'package:reveria/core/features/onboarding/widgets/get_started_butt.dart';
import 'package:reveria/core/helpers/spacing.dart';
import 'package:reveria/core/helpers/strings.dart';
import 'package:reveria/core/theming/styles.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(top: 25.h),
        child: Column(
          children: [
           const AppLogoAndName(),
            verticalSpace(20),
            const DrImageAndText(),
            Padding(
              padding:EdgeInsets.symmetric(horizontal: 30.w),
              child: Column(
                children: [
                  Text(
                    'Manage and schedule all of your medical appointments easily with ${Strings.appTitle} to get a new experience.',
                    textAlign: TextAlign.center,
                    style: TextStyles.font14GrayMoreRegular,
                  ),
                  verticalSpace(30),
                  const GetStartedButton(),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
