import 'package:e_commerece/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldItem extends StatelessWidget {
  String fieldName;
  String hintText;
  Widget? suffixIcon;
  bool isObsecure;
  var keyboardType;
  String? Function(String?)? validator;
  TextEditingController controller;
  TextFieldItem({
    required this.fieldName,
    required this.hintText,
    this.suffixIcon,
    this.isObsecure = false,
    this.keyboardType,
    this.validator,
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(fieldName,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 18.sp),
        textAlign: TextAlign.start,
        ),
        Padding(padding: EdgeInsets.only(
          top: 24.h,bottom: 20.h),
          child: TextFormField(
            decoration:InputDecoration(
              fillColor:  AppColors.whiteColor,
              filled: true,
              focusedBorder:OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
              ),
              hintText: hintText,
              hintStyle: Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.greyColor),
              suffixIcon: suffixIcon,
    ),
    style: TextStyle(color: AppColors.blackColor),
    validator: validator,
    controller: controller,
    obscureText: isObsecure,
    keyboardType: keyboardType,
            ),
          ),

      ],
    );
  }
}
