import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutrotional_tracking_app/core/theming/styles.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    this.controller,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    required this.hintText,
    this.suffixIcon,
    this.backgroundColor,
    this.isObscureText,
    this.textStyle,
    this.textInputType,
    required this.onChanged,
  });
  final TextEditingController? controller;
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final String? hintText;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final bool? isObscureText;
  final TextStyle? textStyle;
  final ValueChanged<String>? onChanged;
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType ?? TextInputType.name,
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        border: InputBorder.none,
        isDense: true,
        contentPadding:
            contentPadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),

        hintStyle: TextStyles.regular14,
        hintText: hintText,
        suffixIcon: suffixIcon,
        fillColor: Colors.white,
        filled: true,
      ),
      obscureText: isObscureText ?? false,
      style: textStyle ?? TextStyles.regular14,
    );
  }
}
