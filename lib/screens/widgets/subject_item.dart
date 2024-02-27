import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizapp/models/subject_model.dart';
import '../../utils/colors/app_colors.dart';
import '../../utils/styles/app_text_style.dart';

class SubjectItem extends StatelessWidget {
  const SubjectItem({super.key,
    required this.iconPath,
    required this.subjectName,
    required this.subject,
    required this.onTap});
  final String iconPath;
  final String subjectName;
  final SubjectModel subject;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Ink(
      padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 12.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.w),
        boxShadow: [
          BoxShadow(
          color: AppColors.c_162023.withOpacity(0.12),
          spreadRadius: 2.w,
          blurRadius: 5.w,
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
                spreadRadius: 2.w,
                blurRadius: 5.w,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                  flex: 5,
                  child: Image.asset(iconPath,width: 90.w,height: 90.h,)),
              Expanded(
                  flex: 5,
                  child: Center(
                    child: Text(subjectName,style: AppTextStyle.interSemiBold.copyWith(
                        color: AppColors.c_5B1CAE,
                        fontSize: 32.w,
                        fontWeight: FontWeight.w500
                    ),),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
