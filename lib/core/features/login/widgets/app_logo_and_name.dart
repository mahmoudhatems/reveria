
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:reveria/core/helpers/spacing.dart';
import 'package:reveria/core/helpers/strings.dart';
import 'package:reveria/core/theming/styles.dart';

class AppLogoAndName extends StatelessWidget {
  const AppLogoAndName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Row( mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/svgs/app icon.svg", width: 100.w,),
            horizontalSpace(10),
             Text(Strings.appTitle, style: TextStyles.font30GrayBold,),
          ],),
          
         
          
      ],
    );
  }
}