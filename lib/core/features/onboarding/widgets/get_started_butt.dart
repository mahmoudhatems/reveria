
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reveria/core/helpers/extentions.dart';
import 'package:reveria/core/routing/routes.dart';
import 'package:reveria/core/theming/colors.dart';
import 'package:reveria/core/theming/styles.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          context.pushNamed(Routes.login);
        },
        style: ButtonStyle(
          backgroundColor:
              WidgetStateProperty.all(ColorsManager.primaryColorTeal),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          minimumSize: WidgetStateProperty.all(Size(double.infinity, 52.h)),
          shape: WidgetStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r))),
        ),
        child: Text(
          "Get Started",
          style: TextStyles.font16WhiteSemiBold,
        ));
  }
}
