
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:reveria/core/helpers/strings.dart';
import 'package:reveria/core/theming/colors.dart';
import 'package:reveria/core/theming/styles.dart';

class SocialLoginButton extends StatelessWidget {
  final String iconPath;
  final String text;
  final VoidCallback? onTap;

  const SocialLoginButton({
    super.key,
    required this.iconPath,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50.h,
        margin: EdgeInsets.symmetric(vertical: 8.h),
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          color: ColorsManager.textFormFieldBackground,
          border: Border.all(color: ColorsManager.lightGray, width: 1.3.w),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              iconPath,
              height: 30.h,
            ),
            SizedBox(width: 12.w),
            Text(
              text,
              style:  TextStyles.font14LightGrayRegular.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SocialLogin extends StatelessWidget {
  const SocialLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialLoginButton(
          iconPath: Strings.googleIcon, // Replace with your Google icon path
          text: 'Sign In with Google',
          onTap: () {
            // Handle Google sign-in logic here
          },
        ),
        SocialLoginButton(
          iconPath: Strings.facebookIcon, // Replace with your Facebook icon path
          text: 'Sign In with Facebook',
          onTap: () {
            // Handle Facebook sign-in logic here
          },
        ),
      ],
    );
  }
}
