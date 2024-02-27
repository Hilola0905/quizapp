import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/colors/app_colors.dart';
import '../../utils/styles/app_text_style.dart';

class VariantBottom extends StatelessWidget {
  const VariantBottom({super.key, required this.title, required this.title1, required this.onTap, required this.isSelected});
 final String title;
 final String title1;
 final VoidCallback onTap;
 final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Ink(
      padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 5.h) ,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(22),
        child:   Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 15.h),
          width: double.infinity,
          decoration: BoxDecoration(
            color: isSelected==true?AppColors.c_5B1CAE: AppColors.white,
            borderRadius: BorderRadius.circular(22),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,style: AppTextStyle.interMedium.copyWith(
                color: isSelected==true?AppColors.white: AppColors.c_5B1CAE,
                fontWeight: FontWeight.w500,
                fontSize: 14.w,
              ),),
              Expanded(
                child: Text(title1,style: AppTextStyle.interMedium.copyWith(
                  color: isSelected==true?AppColors.white: AppColors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 14.w,
                ),),
              ),
            ],
          ),
        ),

      ),
    );
  }
}
