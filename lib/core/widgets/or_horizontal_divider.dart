

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reveria/core/helpers/spacing.dart';
import 'package:reveria/core/theming/colors.dart';
import 'package:reveria/core/theming/styles.dart';

class OrHorizontalDivider extends StatelessWidget {
  const OrHorizontalDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: ColorsManager.lightTextGray,
            thickness: 1.w,
          ),
        ),
        horizontalSpace(10),
        Text(
          'Or',
          style: TextStyles.font14LightGrayRegular,
        ),
        horizontalSpace(10),
        Expanded(
          child: Divider(
            color: ColorsManager.lightTextGray,
            thickness: 1.w,
          ),
        ),
      ],
    );
  }
}
