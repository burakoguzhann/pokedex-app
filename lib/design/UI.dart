import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UIHelper{
  UIHelper._();


  static getDefaultPadding(){
    if(ScreenUtil().orientation==Orientation.portrait){
      return EdgeInsets.all(12.h);
  } else{
    return EdgeInsets.all(8.w);
  }
  }
}