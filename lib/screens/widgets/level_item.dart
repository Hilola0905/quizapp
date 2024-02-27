import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/colors/app_colors.dart';
import '../../utils/styles/app_text_style.dart';

class LevelItem extends StatelessWidget {
  const LevelItem({super.key, required this.levelName,required this.onTap});
  final String levelName;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Ink(
      padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 12.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.w),
          boxShadow: [
            BoxShadow(
              color: AppColors.c_162023.withOpacity(0.08),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ]
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(15.w),
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 15.h),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(15.w),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Center(
            child: Text(levelName,style: AppTextStyle.interSemiBold.copyWith(
                color: AppColors.c_5B1CAE,
                fontSize: 32.w,
                fontWeight: FontWeight.w500
            ),),
          ),
        ),
      ),
    );
  }
}
