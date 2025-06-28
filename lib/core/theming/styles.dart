import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutrotional_tracking_app/core/theming/font_weight_helper.dart';

abstract class TextStyles {
  static TextStyle bold15 = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle semiBold13 = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle regular14 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle bold11_5 = TextStyle(
    fontSize: 11.5.sp,
    fontWeight: FontWeightHelper.semiBold,
  );
}
