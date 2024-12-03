
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:reveria/core/helpers/strings.dart';
import 'package:reveria/core/theming/styles.dart';

class AppLogoAndName extends StatelessWidget {
  const AppLogoAndName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
       SvgPicture.asset('assets/svgs/App Logo.svg', width: 50.w, height: 50.h,),
         SizedBox(width: 10.w),
        Text(Strings.appTitle, style: TextStyles.font32TealBold)
      ],
    );
  }
}