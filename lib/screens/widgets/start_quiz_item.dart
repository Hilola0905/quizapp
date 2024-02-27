import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizapp/models/subject_model.dart';
import '../../models/quiz_model.dart';
import '../../utils/colors/app_colors.dart';
import '../../utils/styles/app_text_style.dart';
import '../../utils/utility_function.dart';
import '../quiz/quiz_screen.dart';

class StartQuizItem extends StatelessWidget {
  const StartQuizItem({super.key,
    required this.subject, required this.level, required this.question,
  });
  final SubjectModel subject;
  final String level;
  final List<QuizModel> question;

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 15.h),
      margin: EdgeInsets.symmetric(horizontal: 20.w,vertical: 15.h),
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
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                      flex: 5,
                      child: Container(

                          child: Image.asset(subject.icon,width: 90.w,height: 90.h,))),
                  Expanded(
                      flex: 5,
                      child: Center(
                        child: Text(subject.subjectName,style: AppTextStyle.interSemiBold.copyWith(
                            color: AppColors.c_5B1CAE,
                            fontSize: 32.w,
                            fontWeight: FontWeight.w500
                        ),),
                      )
                  ),
                ],
              ),
              SizedBox(height: 10,),
              getRichText("Language type", subject.subjectName, context),
              getRichText("Level", level.toString(), context),
              getRichText("time",getTime(question.length*15), context),
              getRichText("description",subject.description, context),

            ],
          ),
        ],
      ),
    );
  }
}
