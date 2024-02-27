import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:quizapp/data/data_repository.dart';
import 'package:quizapp/utils/colors/app_colors.dart';
import 'package:quizapp/utils/images/app_images.dart';
import 'package:quizapp/utils/size/size_utils.dart';

import '../subjects/subject_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _init();
    // TODO: implement initState
    super.initState();
  }
  _init() async{
    DataRepository.inistange.loadSubject();
    Future.delayed(const Duration(seconds: 4),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
        return SubjectScreen();
      }));
    });
  }
  @override
  Widget build(BuildContext context) {
    width=MediaQuery.of(context).size.width;
    height=MediaQuery.of(context).size.height;
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: AppColors.c_A76AE4,
        body: Center(
          child: Lottie.asset(AppImages.quizAnimation),
        ),
      ),
    );
  }
}