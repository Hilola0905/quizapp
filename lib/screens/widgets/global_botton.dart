import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizapp/utils/styles/app_text_style.dart';

import '../../utils/colors/app_colors.dart';

class GlobalBottom extends StatelessWidget {
  const GlobalBottom({super.key, required this.title, required this.color, required this.titlecolor, required this.onTap, required this.bottomVisibility});
  final String title;
  final Color color;
  final Color titlecolor;
  final VoidCallback onTap;
  final bool bottomVisibility;


  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: bottomVisibility,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 18.h),
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.w),

            //color: AppColors.c_A76AE4,
          ),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(20.w),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.w),
                color: color,
              ),
              child: Center(child: Text(title,style: AppTextStyle.interMedium.copyWith(
                color: titlecolor
              ),)),
            ),
          ),
        ),
      ),
    );
  }
}
