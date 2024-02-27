import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quizapp/models/quiz_model.dart';
import 'package:quizapp/models/subject_model.dart';
import 'package:quizapp/screens/quiz/quiz_screen.dart';
import 'package:quizapp/screens/widgets/global_contener.dart';
import 'package:quizapp/screens/widgets/start_quiz_item.dart';
import 'package:quizapp/utils/styles/app_text_style.dart';
import '../../utils/colors/app_colors.dart';
import '../../utils/images/app_images.dart';

class StartQuiz extends StatelessWidget {
  const StartQuiz({super.key, required this.subjectModel, required this.question, required this.level});
  final SubjectModel subjectModel;
  final List<QuizModel> question;
  final String level;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          GlobalConteyner(),
          Column(
            children: [
              Expanded(
                  flex: 3,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10.h,horizontal: 8.h),
                    padding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 10.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.w),
                      color: AppColors.transparent,
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
                        Text("Start Quiz",style: AppTextStyle.interMedium.copyWith(
                          color: AppColors.white,
                          fontSize: 20.w,
                          fontWeight: FontWeight.w500,
                        ),),
                        const SizedBox(),
                      ],
                    ),
                  ),

              ),
              Expanded(
                  flex: 3,
                  child: Container(
                      padding:EdgeInsets.symmetric(vertical: 20.h,horizontal: 20.w),
                      decoration: const BoxDecoration(
                        color: AppColors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(AppImages.quiz,width: 100.w,height: 100.w,)),
              ),
              Expanded(
                  flex: 10,
                  child: StartQuizItem(subject: subjectModel, level: level, question: question,),
              ),
              Expanded(
                  flex: 3,
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(10.w),
                    padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 5.h),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 4,
                            child: Row(
                              children: [
                                Icon(Icons.access_alarm,weight: 10.w,),
                                SizedBox(width: 5.w,),
                                Text(getTime(question.length*15),style: AppTextStyle.interMedium.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18.w,
                                ),),
                              ],
                            )
                        ),
                        Expanded(
                            flex: 6,
                            child: Ink(
                              padding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 3.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.w),
                                color: Colors.transparent
                              ),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(20.w),
                                onTap: (){
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                                    return QuizScreen(subjectModel: subjectModel, question: question, level: level,);
                                  }));
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 3.w),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.w),
                                    color: Colors.redAccent,
                                  ),
                                  child: Center(
                                    child: Text("Start",style: AppTextStyle.interMedium.copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18.w,
                                    ),),
                                  ),
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
