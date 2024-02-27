import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:quizapp/models/subject_model.dart';
import 'package:quizapp/utils/images/app_images.dart';
import 'dart:io';
class DataRepository{

  DataRepository._();
  static final inistange=DataRepository._();
  factory DataRepository ()=>inistange;
  List<SubjectModel> allSubject=[];
  Future<void> loadSubject() async{
    var data= await rootBundle.loadString(AppImages.testData);
    var decodeData=jsonDecode(data);
    allSubject=(decodeData["data"] as List?)?.map((e) => SubjectModel.fromJson(e)).toList() ?? [];

  }
}