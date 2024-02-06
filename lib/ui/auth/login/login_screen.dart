import 'package:e_commerece/ui/auth/register/register_screen.dart';
import 'package:e_commerece/utils/app_colors.dart';
import 'package:e_commerece/utils/text_field_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "login screen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var passwordController = TextEditingController();
  var emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isObsecure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
        color: Theme.of(context).primaryColor,
    height: double.infinity,
    child: SingleChildScrollView(
    child: Column(
    children: [
    Padding(
    padding: EdgeInsets.only(top : 91.h,bottom:87.h ,left:97.w ,right:97.w),
    child: Image.asset("assets/images/Route.png"),

    ),
    Padding(padding: EdgeInsets.symmetric(
    horizontal: 16.w,
    ),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
    Text("Welcome Back To Route",
    style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 24.sp),
    ),
    Text("Please sign in with your mail",
    style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 16.sp),
    ),
    Padding(padding:EdgeInsets.only(top: 40.h) ,
    child: Form(
    key: formKey,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
    TextFieldItem(
        fieldName: "E-mail address",
    hintText: "enter your email address",
    controller: emailController,
    validator: (value){
    if(value == null || value.trim().isEmpty){
    return "please enter your email address";
    }
    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);
    if(!emailValid){
    return "invalid email";
    }
    return null;
    }
    ),
    TextFieldItem(fieldName: "Password",
    hintText: "enter your password",
    controller: passwordController,
    validator: (value){
    if(value == null || value.trim().isEmpty){
    return "please enter your password";
    }
    if(value.trim()!.length < 6 || value.trim()!.length > 30){
      return "password should be >6 & <30";
    }
    return null;
    },
      isObsecure: isObsecure,
      suffixIcon: InkWell(
        child: isObsecure ? Icon(Icons.visibility_off) :
        Icon(Icons.visibility),
        onTap: (){
          if(isObsecure){
            isObsecure = false;
          }else{
            isObsecure = true;
          }
          setState(() {});
        }
      ),

    ),
      Text("Forgot password",style:  Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.whiteColor),
        textAlign: TextAlign.end,
        ),
      Padding(
        padding: EdgeInsets.only(top: 35.h),
        child: ElevatedButton(
          onPressed: (){
            if(formKey.currentState!.validate()){
              Navigator.pushReplacementNamed(context, RegisterScreen.routeName);
            }
          },
          child: Container(
            height: 64.h,
            width: 398.w,
            child: Center(
              child: Text("Login",style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: AppColors.primaryColor,fontSize: 20.sp,
              ),
              ),
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.whiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.r))
            )
          ),
        ),
      ),
      Padding(padding: EdgeInsets.only(top : 20.h),
        child: Row(
          children: [
            Padding(
              padding:  EdgeInsets.only(left: 37.w),
              child: Text("Don't have an account ",style:Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.whiteColor)),
            ),
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, RegisterScreen.routeName);
              },
                child: Text("Create an account",style:Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.whiteColor))),
          ],
        ),
      )



  ],
  ),
  ),
  )
  ],
  ),
  )
  ],
  )
  ),
  ),
  );
}}
