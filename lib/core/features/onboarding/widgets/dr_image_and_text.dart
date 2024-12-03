

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:reveria/core/theming/styles.dart';

class DrImageAndText extends StatelessWidget {
  const DrImageAndText({super.key});
  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.topCenter,
      children: [
      SvgPicture.asset('assets/svgs/App Logo LowOpacity.svg'),
      Container(
          foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.white, Colors.white.withOpacity(0.1)],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: const [0.15, 0.44])),
          child: Image.asset('assets/images/on boarding male dr1.png')),
      Positioned(
        bottom: 30,
        left: 0,
        right: 0,
        child: Text(
          "Best Doctor\n Appointment App",
          style: TextStyles.font32TealBold.copyWith(height: 1.4.h),
          textAlign: TextAlign.center,
        ),
      )
    ]);
  }
}
