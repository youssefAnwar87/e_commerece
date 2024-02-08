 import 'package:e_commerece/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class DialogUtils {
  static void showLoading(BuildContext context ,String  message) {
    showDialog(context: context, barrierDismissible: false, builder: (_) {
      return AlertDialog(
        backgroundColor: Theme.of(context).primaryColor,
        content: Row(
          children: [
            Text(message,style: TextStyle(color: AppColors.whiteColor)),
            Spacer(),
            CircularProgressIndicator(color:AppColors.whiteColor ),
          ],
        ),
      );
    });
  }

  static void hideLoading(BuildContext context) {
    Navigator.pop(context);
  }

  static void showErrorDialog(BuildContext context, String message,String title) {
    showDialog(context: context, barrierDismissible: false, builder: (_) {
      return AlertDialog(

        backgroundColor: Theme.of(context).primaryColor,
        title: Text(title,style: TextStyle(color: AppColors.whiteColor)),
        content: Text(message,style: TextStyle(color: AppColors.whiteColor),),
        actions: [
          TextButton(onPressed: () {
            Navigator.pop(context);
          }, child: Text("Ok",style : TextStyle(color: AppColors.whiteColor)))
        ],
      );
    });
  }
}