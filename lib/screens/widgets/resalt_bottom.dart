import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizapp/utils/colors/app_colors.dart';
import '../../utils/styles/app_text_style.dart';

class ResultBottom extends StatelessWidget {
  const ResultBottom({super.key, required this.text, required this.onTap});
  final String text;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.w),
            boxShadow: [
              BoxShadow(
                color: AppColors.c_5B1CAE.withOpacity(0.5),
                spreadRadius: 2.w,
                blurRadius: 5.w,
                offset: Offset(0, 3),
              ),
            ],
          ),
          //color: AppColors.c_A76AE4,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(20.w),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.w),
              color: AppColors.c_5B1CAE.withOpacity(0.2),
            ),
            child: Center(child: Text(text,style: AppTextStyle.interMedium.copyWith(
                color: AppColors.white
            ),)),
          ),
        ),
      ),
    );
  }
}
