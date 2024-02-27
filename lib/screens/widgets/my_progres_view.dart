import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/colors/app_colors.dart';
import '../../utils/styles/app_text_style.dart';

class MyProgressView extends StatelessWidget {
  const MyProgressView(
      {super.key,
        required this.timeText,
        required this.progressValue
      }
      );

  final String timeText;
  final double progressValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          Row(
            children: [
              const Spacer(),
              const Icon(Icons.access_alarm,color: AppColors.white,),
              SizedBox(width: 5.w),
              Text(
                timeText,
                style: AppTextStyle.interMedium.copyWith(
                  fontSize: 16.w,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: 4.h,),
          LinearProgressIndicator(
            minHeight: 10.h,
            backgroundColor: AppColors.c_162023,
            borderRadius: BorderRadius.circular(8.w),
            color: AppColors.c_F2954D,
            value: progressValue,
          ),
        ],
      ),
    );
  }
}