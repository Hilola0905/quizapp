import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quizapp/screens/widgets/check_answers_items.dart';
import 'package:quizapp/utils/colors/app_colors.dart';
import '../../models/quiz_model.dart';
import '../../utils/images/app_images.dart';
import '../../utils/styles/app_text_style.dart';
class CheckAnswers extends StatelessWidget {
  const CheckAnswers({super.key, required this.question, required this.selectQuestion});
  final List<QuizModel> question;
  final Map<int,int> selectQuestion;
  @override
  Widget build(BuildContext context) {
    print(question);
    print(question[0]);
    print(question[1]);
    print(question[2]);
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
        statusBarIconBrightness: Brightness.dark
      ),
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 14.h,horizontal: 14.w),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.h,horizontal: 8.h),
                padding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 5.w),
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
                    Text("Check Answers",style: AppTextStyle.interMedium.copyWith(
                      color: AppColors.white,
                      fontSize: 20.w,
                      fontWeight: FontWeight.w500,
                    ),),
                    const SizedBox(),
                  ],
                ),
              ),

              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  children: [
                        ...List.generate(question.length, (index){
                          return  CheckAnswersItems(
                            question: question[index],
                            isTrue:( selectQuestion[index]! + 1)==question[index].vtrue,
                            selectIndex: selectQuestion[index]!,
                            len: question.length,
                            aIndex: index,
                          );
                        },
                        ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
