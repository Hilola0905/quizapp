import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/colors/app_colors.dart';
import '../../utils/size/size_utils.dart';

class GlobalConteyner extends StatelessWidget {
  const GlobalConteyner({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      height: height/2,
      decoration: BoxDecoration(
          color: AppColors.c_A76AE4,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.w),
              bottomRight: Radius.circular(20.w)
          )
      ),
    )
    ;
  }
}
