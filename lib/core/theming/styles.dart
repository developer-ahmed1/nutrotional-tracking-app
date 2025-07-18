import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutrotional_tracking_app/core/theming/font_weight_helper.dart';

abstract class TextStyles {
  static TextStyle bold18 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle bold15 = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeightHelper.bold,
  );
  static const TextStyle bold16 = TextStyle(
    fontWeight: FontWeight.bold, 
    fontSize: 16
  );
  static TextStyle semiBold13 = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle regular14 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle semiBold11_5 = TextStyle(
    fontSize: 11.5.sp,
    fontWeight: FontWeightHelper.semiBold,
  );
}
