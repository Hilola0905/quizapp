import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quizapp/models/level_model.dart';
import 'package:quizapp/models/quiz_model.dart';
import 'package:quizapp/models/subject_model.dart';
import 'package:quizapp/screens/start_quiz/start_quiz.dart';
import 'package:quizapp/screens/widgets/level_item.dart';

import '../../utils/colors/app_colors.dart';
import '../../utils/images/app_images.dart';
import '../../utils/styles/app_text_style.dart';



class CheckLevel extends StatelessWidget {
  const CheckLevel({super.key,required this.subjectModel});
  final SubjectModel subjectModel;

  @override
  Widget build(BuildContext context) {
    List<QuizModel> question=[];
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
       body:   Column(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: [
           Container(
             margin: EdgeInsets.symmetric(vertical: 10.h,horizontal: 8.h),
             padding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 14.w),
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(20.w),
               color: AppColors.c_A76AE4,
               boxShadow: [
                 BoxShadow(
                   color: AppColors.c_5B1CAE.withOpacity(0.5),
                   spreadRadius: 2.w,
                   blurRadius: 5.w,
                   offset: const Offset(0, 3),
                 ),
               ],
             ),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 InkWell(
                   onTap: (){
                     Navigator.pop(context);
                   },
                   child:  SvgPicture.asset(AppImages.back,width: 18.w,height: 18.h,color: AppColors.white,),
                 ),
                 Text("Choose Level",style: AppTextStyle.interMedium.copyWith(
                   color: AppColors.white,
                   fontSize: 20.w,
                   fontWeight: FontWeight.w500,
                 ),),
                 const SizedBox(),
               ],
             ),
           ),
           SizedBox(),
           ...List.generate(LevelModel.values.length, (index){
             return LevelItem(levelName: LevelModel.values[index].name, onTap: () {
               if(index==0){
                 question=subjectModel.easyText;
               }
               if(index==2){
                 question=subjectModel.hardText;
               }
               if(index==1){
                 question=subjectModel.mediumText;
               }
               print(question);
               print(index);
               Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                      return StartQuiz(subjectModel: subjectModel, question: question, level: LevelModel.values[index].name,
                      );
                    }));
             },);
           }),
           SizedBox(),
           SizedBox(),
           SizedBox(),
         ],
       )
      ),
    );
  }
}

