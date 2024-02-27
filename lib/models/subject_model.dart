import 'package:quizapp/models/quiz_model.dart';


class SubjectModel{
  SubjectModel( {
    required  this.hardText,
    required this.easyText,
    required this.mediumText,
    required this.subjectName,
    required this.icon,
    required this.description
});
  factory SubjectModel.fromJson(Map<dynamic,dynamic> json){
    return SubjectModel(
      subjectName: json["subject_name"] as String ?? "",
      easyText: (json["easy_test"] as List?)?.map((e) => QuizModel.fromJson(e)).toList() ?? [] ,
      hardText: (json["hard_test"] as List?)?.map((e) => QuizModel.fromJson(e)).toList() ?? [] ,
      mediumText: (json["medium_test"] as List?)?.map((e) => QuizModel.fromJson(e)).toList() ?? [] ,
      icon: json["icon"] ,
      description: json["description"] ,

    );
  }
  final String subjectName;
  final List<QuizModel> hardText;
  final List<QuizModel> easyText;
  final List<QuizModel> mediumText;
  final String icon;
  final String description;
}