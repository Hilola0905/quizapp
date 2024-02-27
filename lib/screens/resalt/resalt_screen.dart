import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quizapp/models/subject_model.dart';
import 'package:quizapp/screens/check_answers/check_answers.dart';
import 'package:quizapp/screens/quiz/quiz_screen.dart';
import 'package:quizapp/screens/subjects/subject_screen.dart';
import 'package:quizapp/screens/widgets/global_quiz_icon.dart';
import 'package:quizapp/screens/widgets/resalt_bottom.dart';
import 'package:quizapp/screens/widgets/resalt_item.dart';
import 'package:quizapp/utils/images/app_images.dart';
import 'package:quizapp/utils/styles/app_text_style.dart';
import '../../models/quiz_model.dart';
import '../../utils/colors/app_colors.dart';



class ResaltScreen extends StatefulWidget {
  const ResaltScreen({super.key, required this.subjectModel, required this.level, required this.answers, required this.question, required this.spentTime});
  final SubjectModel subjectModel;
  final String level;
  final Map<int,int> answers;
  final List<QuizModel> question;
  final int spentTime;


  @override
  State<ResaltScreen> createState() => _ResaltScreenState();
}


class _ResaltScreenState extends State<ResaltScreen> {
  int trueAnswers=0;
  double result=0.0;
  @override
  void initState() {
    for(int i=0;i<widget.question.length;i++){
      if(widget.question[i].vtrue==widget.answers[i]){
        trueAnswers++;
      }
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
        value: const SystemUiOverlayStyle(
          statusBarColor: AppColors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        child: Scaffold(
          body: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.h,vertical: 25.w),
            child: Column(
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.w),
                        color: AppColors.c_5B1CAE.withOpacity(0.2),
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
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                                  return const SubjectScreen();
                                }));
                              },
                              child:  SvgPicture.asset(AppImages.back,width: 18.w,height: 18.h,color: AppColors.white,),
                            ),
                             Text("Quiz Result",style: AppTextStyle.interMedium.copyWith(
                               color: AppColors.white,
                               fontSize: 20.w,
                               fontWeight: FontWeight.w500,
                             ),),
                             const SizedBox(),
                        ],
                      ),
                    )
                ),
                Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 8.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.w),
                        color: AppColors.c_5B1CAE.withOpacity(0.2),
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
                        children: [
                          Expanded(
                              flex: 5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                        RichText(
                            text: TextSpan(
                                text: " Type : ",
                                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                  fontWeight: FontWeight.w400,
                                    fontSize: 18.w,
                                    color: AppColors.white
                                ),
                                children:<TextSpan> [
                                  TextSpan(
                                    text: widget.subjectModel.subjectName,
                                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                      fontWeight: FontWeight.w400,
                                        fontSize: 18.w,
                                        color: AppColors.white
                                    ),

                                  ),
                                ]
                            )
                        ),
                        RichText(
                            text: TextSpan(
                                text: " Level : ",
                                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                  fontWeight: FontWeight.w400,
                                    fontSize: 18.w,
                                    color: AppColors.white
                                ),
                                children:<TextSpan> [
                                  TextSpan(
                                    text: widget.level,
                                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                      fontWeight: FontWeight.w400,
                                        fontSize: 18.w,
                                        color: AppColors.white
                                    ),

                                  ),
                                ]
                            )
                        ),
                        RichText(
                            text: TextSpan(
                                text: "Count : ",
                                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18.w,
                                  color: AppColors.white
                                ),
                                children:<TextSpan> [
                                  TextSpan(
                                    text: widget.answers.values.length.toString(),
                                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                      fontWeight: FontWeight.w400,
                                        fontSize: 18.w,
                                        color: AppColors.white
                                    ),

                                  ),
                                ]
                            )
                        ),
                                ],
                              )),
                          Expanded(
                            flex: 5,
                              child: GlobalQuizIcon(image: widget.subjectModel.icon,)),
                        ],
                      ),
                    )
                ),
                Expanded(
                    flex: 3,
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.w),
                        color: AppColors.c_5B1CAE.withOpacity(0.2),
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
                            children: [
                              Expanded(
                                flex: 1,
                                child: Stack(
                                  children: [
                                    Center(
                                      child: SizedBox(
                                        width: 110.h,
                                        height: 110.h,
                                        child: Transform.rotate(
                                           angle: pi/6,
                                          child: CircularProgressIndicator(
                                            value: trueAnswers/widget.question.length,
                                            color: AppColors.c_F2954D,
                                            strokeCap: StrokeCap.round,
                                            strokeWidth: 8.h,
                                            backgroundColor: AppColors.c_F2954D.withOpacity(0.2),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(
                                          text: trueAnswers .toString(),
                                          style: AppTextStyle.interSemiBold.copyWith(
                                            fontSize: 27.w,
                                              color: AppColors.white
                                          ),
                                          children: [
                                            TextSpan(
                                              text:
                                              "/${(widget.question.length).toString()}\n Score",
                                              style: AppTextStyle.interRegular.copyWith(
                                                fontSize: 13.w,
                                                color: AppColors.white
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Center(child: Text(
                                    (trueAnswers/widget.question.length)*100>60 ?"Passed\nYour Score\n${((trueAnswers/widget.question.length)*100).toInt()} % " :  "Failed\nYour Score\n${((trueAnswers/widget.question.length)*100).toInt()} % ",
                                  style: AppTextStyle.interSemiBold.copyWith(
                                    color: AppColors.white,
                                    fontSize: 24.w,
                                  ),
                                ),),),
                            ]
                        )
                    )
                ),
                Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Expanded(
                            flex:6,
                            child: ResultItems(numbers:trueAnswers.toString(), text: "Correct Answers", color: Colors.green)),
                       const  Expanded(
                            flex:1,
                            child: SizedBox()),
                        Expanded(
                            flex:6,
                            child: ResultItems(numbers: (widget.answers.values.length-trueAnswers).toString(), text: "Wrong Answers", color: Colors.redAccent),
                        ),
                      ],
                    )
                ),
                Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Expanded(
                            flex:6,
                            child: ResultItems(numbers: getTime(widget.spentTime), text: "Total Time", color: Colors.orangeAccent)),
                       const  Expanded(
                            flex:1,
                            child: SizedBox()),
                        Expanded(
                            flex:6,
                            child: ResultItems(numbers: getTime(widget.spentTime~/widget.question.length), text: "Avg Time", color: Colors.deepOrange),
                        ),
                      ],
                    )
                ),
                Expanded(
                  flex: 1,
                  child: ResultBottom(text: 'Check Answers', onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return  CheckAnswers(question: widget.question, selectQuestion: widget.answers,);
                    }));
                  },
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: ResultBottom(text: 'Try quiz again', onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                        return const SubjectScreen();
                      }));
                    },)
                ),
             ]
          ),
    ),
        ),
    );
  }
}

