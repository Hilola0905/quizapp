import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizapp/models/subject_model.dart';
import 'package:quizapp/screens/resalt/resalt_screen.dart';
import 'package:quizapp/screens/widgets/global_botton.dart';
import 'package:quizapp/screens/widgets/global_quiz_icon.dart';
import 'package:quizapp/screens/widgets/variant_bottom.dart';
import 'package:quizapp/utils/colors/app_colors.dart';
import 'package:quizapp/utils/images/app_images.dart';
import 'package:quizapp/utils/styles/app_text_style.dart';
import '../../models/level_model.dart';
import '../../models/quiz_model.dart';
import '../../utils/size/size_utils.dart';
import '../widgets/global_contener.dart';
import '../widgets/my_progres_view.dart';
class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key, required this.subjectModel, required this.question, required this.level});
  final SubjectModel subjectModel;
  final List<QuizModel> question;
  final String level;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int activeIndex=0;
  int selectIndex=0;
  int spentTime=0;
  int count=0;
  Map<int,int> selectAnswers={};
  Future<void> _timerLogic() async {
    for (int i = widget.question.length * 15; i > 0; i--) {
      setState(() {
        count = i;
      });
      await Future.delayed(const Duration(seconds: 1));
    }

    _navigateToResultScreen();
  }

  @override
  void initState() {
    for(int i=0;i<widget.question.length;i++){
      selectAnswers[i]=0;
    }
    _timerLogic();
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
        backgroundColor: AppColors.white,
        body: Stack(
          children: [
           const GlobalConteyner(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                   flex: 2,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 12.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                              flex: 7,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  GlobalQuizIcon(image: widget.subjectModel.icon,),
                                  const SizedBox(),
                                ],
                              ),
                          ),
                          Expanded(
                              flex: 3,
                              child:  GlobalBottom(title: "Tugatish", color: AppColors.white, titlecolor: AppColors.c_5B1CAE,  bottomVisibility: true, onTap:(){
                                selectAnswers[activeIndex]=selectIndex;
                                _navigateToResultScreen();
                              },)),
                        ],
                      ),
                    ),
                ),
                Expanded(
                    flex: 1,
                    child: MyProgressView(
                        timeText: getTime(count),
                        progressValue: count / (widget.question.length * 15))
                    ),
                Expanded(
                   flex: 7,
                    child:ListView(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 15.h),
                          margin: EdgeInsets.symmetric(horizontal: 15.w,vertical: 15.h),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(22.w),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2.w,
                                blurRadius: 5.h,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Center(
                                child: Text("${activeIndex+1}/${widget.question.length} Question",style: AppTextStyle.interMedium.copyWith(
                                  color: AppColors.c_5B1CAE,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.w,
                                ),),
                              ),
                              Text(widget.question[activeIndex].question,style: AppTextStyle.interMedium.copyWith(
                                color: AppColors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 18.w,
                              ),),
                            ],
                          ),
                        ),
                        VariantBottom(title: "A. ", title1: widget.question[activeIndex].v1,
                          onTap: () {
                          setState(() {
                            selectIndex=1;
                          });
                        }, isSelected: selectIndex==1,),
                        VariantBottom(title: "B. ", title1: widget.question[activeIndex].v2,
                          onTap: () {
                            setState(() {
                              selectIndex=2;
                            });
                          }, isSelected: selectIndex==2,
                        ),
                        VariantBottom(title: "C. ", title1: widget.question[activeIndex].v3,
                          onTap: () {
                            setState(() {
                              selectIndex=3;
                            });
                          }, isSelected: selectIndex==3,
                        ),
                        VariantBottom(title: "D. ", title1: widget.question[activeIndex].v4,
                          onTap: () {
                            setState(() {
                              selectIndex=4;
                            });
                          }, isSelected: selectIndex==4,
                        ),
                      ],
                    )),
                Expanded(
                   flex: 2,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 15.w),
                      child:  Row(
                        children: [
                          Expanded(
                              flex: 4,
                              child: GlobalBottom(title: 'Previous', color: AppColors.c_A76AE4, titlecolor: AppColors.white, onTap: (){
                                selectAnswers[activeIndex]=selectIndex;
                                if(activeIndex>=1){
                                  activeIndex--;
                                  selectIndex=selectAnswers[activeIndex]!;

                                }
                                setState(() {
                                });
                              }, bottomVisibility: activeIndex!=0,)),
                         const Expanded(
                              flex: 3,
                              child: SizedBox()),
                          Expanded(
                              flex: 4,
                              child: GlobalBottom(title: "Next", color: AppColors.c_A76AE4, titlecolor: AppColors.white, onTap: (){
                                selectAnswers[activeIndex]=selectIndex;
                                if(activeIndex<widget.question.length-1){
                                  activeIndex++;
                                  selectIndex=0;
                                }
                                setState(() {
                                });
                              },
                                bottomVisibility: activeIndex!=widget.question.length-1
                                ,)
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
  void _navigateToResultScreen() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
      return ResaltScreen(
        subjectModel: widget.subjectModel,
        level: widget.level,
        answers: selectAnswers,
        question: widget.question,
        spentTime: widget.question.length * 15 - count,
      );
    }));
  }

}

String getTime(int time){
  int min=time~/60;
  int sec=time%60;
  String min1=min.toString().length==1? "0$min" :"$min";
  String sec1=sec.toString().length==1? "0$sec" :"$sec";
  return "$min1 : $sec1";
}
