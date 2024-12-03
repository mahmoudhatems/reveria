
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reveria/core/theming/colors.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton(
      {super.key,
      this.borderRadius,
      this.backGroundColor,
      this.horizontalPadding,
      this.verticalPadding,
      this.buttonWidth,
      this.buttonheight,
      required this.textStyle,
      required this.buttonText,
      required this.onPressed});
  final double? borderRadius;
  final Color? backGroundColor;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? buttonWidth;
  final double? buttonheight;
  final TextStyle textStyle;
  final String buttonText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(borderRadius?.r ?? 16.r))),
          backgroundColor: WidgetStateProperty.all(
              backGroundColor ?? ColorsManager.primaryColorTeal),
          padding: WidgetStatePropertyAll(EdgeInsets.symmetric(
              horizontal: horizontalPadding?.w ?? 12.w,
              vertical: verticalPadding?.h ?? 14.h)),
          fixedSize: WidgetStatePropertyAll(Size(
              buttonWidth?.w ?? double.maxFinite, buttonheight?.h ?? 52.h))),
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: textStyle,
      ),
    );
  }
}
