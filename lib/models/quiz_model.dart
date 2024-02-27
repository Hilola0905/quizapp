import 'dart:ui';

import '../utils/colors/app_colors.dart';

class QuizModel{
  QuizModel( {
    required this.question,
    required this.v1,
    required this.v2,
    required this.v3,
    required this.v4,
    required this.vtrue,
    required this.colors,
});
  factory QuizModel.fromJson(Map<String,dynamic> json){
    return QuizModel(
      question: json["question_text"] as String ?? "",
      v1:  json["v1"] as String ?? "",
      v2:  json["v2"] as String ?? "",
      v3:  json["v3"] as String ?? "",
      v4:  json["v4"] as String ?? "",
      vtrue:  json["vtrue"] as int ?? 1,
      colors: [AppColors.white,AppColors.white,AppColors.white,AppColors.white,]
    );
  }
  final String question;
  final String v1;
  final String v2;
  final String v3;
  final String v4;
  final int vtrue;
 final List<Color> colors;
}