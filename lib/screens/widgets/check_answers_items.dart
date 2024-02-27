import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizapp/screens/widgets/variant_item.dart';
import '../../models/quiz_model.dart';
import '../../utils/colors/app_colors.dart';
import '../../utils/styles/app_text_style.dart';
class CheckAnswersItems extends StatelessWidget {
  const CheckAnswersItems({super.key, required this.question, required this.isTrue, required this.selectIndex, required this.len, required this.aIndex});
  final QuizModel question;
  final int len;
  final int aIndex;
  final bool isTrue;
  final int selectIndex;
  @override
  Widget build(BuildContext context) {
    if(selectIndex==question.vtrue){
      question.colors[selectIndex-1]=Colors.green;
    }
    if(selectIndex!=question.vtrue)
    {
      selectIndex!=0 ?question.colors[selectIndex-1]=Colors.red: null;
      question.colors[question.vtrue-1]=Colors.blue;
    }
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w,vertical: 8.h),
      padding: EdgeInsets.symmetric(horizontal: 10.h,vertical: 8.h),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.white
        )
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 15.h),
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.white,
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
            child: Column(
              children: [
                Center(
                  child: Text("${aIndex+1}/$len Question",style: AppTextStyle.interMedium.copyWith(
                    color: AppColors.c_5B1CAE,
                    fontWeight: FontWeight.w500,
                    fontSize: 18.w,
                  ),),
                ),
                Text(question.question,style: AppTextStyle.interMedium.copyWith(
                  color: AppColors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 18.w,
                ),),
              ],
            ),
          ),
          VariantItem(title:"A. " , title1: question.v1, isTrue: isTrue, color:question.colors[0], ),
          VariantItem(title:"B. " , title1: question.v2, isTrue: isTrue, color: question.colors[1], ),
          VariantItem(title:"C. " , title1: question.v3, isTrue: isTrue, color: question.colors[2], ),
          VariantItem(title:"D. " , title1: question.v4, isTrue: isTrue, color: question.colors[3], ),
    ],
      ),
    );
  }
}


