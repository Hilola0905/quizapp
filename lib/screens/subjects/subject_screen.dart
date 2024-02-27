import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quizapp/data/data_repository.dart';
import 'package:quizapp/models/subject_model.dart';
import 'package:quizapp/screens/check_level/chech_level.dart';
import 'package:quizapp/screens/resalt/resalt_screen.dart';
import 'package:quizapp/screens/widgets/global_contener.dart';
import 'package:quizapp/screens/widgets/global_quiz_icon.dart';
import 'package:quizapp/screens/widgets/subject_item.dart';
import 'package:quizapp/utils/colors/app_colors.dart';
import 'package:quizapp/utils/images/app_images.dart';
import 'package:quizapp/utils/size/size_utils.dart';
import 'package:quizapp/utils/styles/app_text_style.dart';

class SubjectScreen extends StatefulWidget {
  const SubjectScreen({super.key});

  @override
  State<SubjectScreen> createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {


  @override
  Widget build(BuildContext context) {
    //trueAnswers=0;
    //result=0.0;
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
              children: [
             Padding(
               padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 30.h),
               child: const Center(
                 child: GlobalQuizIcon(image: AppImages.quiz,),
               ),
             ),
                Expanded(
                  child: ListView(
                    children: [
                      ...List.generate(DataRepository().allSubject.length, (index){
                        SubjectModel subject =DataRepository().allSubject[index];
                        return SubjectItem(
                          iconPath: subject.icon,
                          subjectName: subject.subjectName,
                          subject: subject, onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return CheckLevel(subjectModel: subject,);
                            }));
                        },
                        );
                      }),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
