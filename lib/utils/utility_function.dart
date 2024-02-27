
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/level_model.dart';

LevelModel getLevelFromJson(String level){
  switch(level){
    case"easy":{
      return LevelModel.easy;
    }
    case"hard":{
      return LevelModel.hard;
    }
    default :{
      return LevelModel.medium;
    }
  }

}

Widget getRichText(String text1,String text2, BuildContext context ){
  return RichText(
      text: TextSpan(
        text: " $text1 : ",
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
          fontWeight: FontWeight.w400,
        ),
        children:<TextSpan> [
          TextSpan(
            text: text2,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              fontWeight: FontWeight.w400,
            ),

          ),
        ]
      )
  );
}


