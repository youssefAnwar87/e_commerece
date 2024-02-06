import 'package:e_commerece/utils/app_colors.dart';
import 'package:e_commerece/utils/text_field_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = "register screen";

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var ConfirmationPasswordController = TextEditingController();
  var emailController = TextEditingController();
  var PhoneController = TextEditingController();
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
            Padding(padding: EdgeInsets.only(
              top: 91.h,bottom: 46.h,left: 97.w,right: 97.w),
            child: Image.asset("assets/images/Route.png"),
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                    Form(
                      key : formKey,
                        child: Column(
                          children: [
                            TextFieldItem(
                                fieldName: "Full Name",
                                hintText: "enter your name",
                                controller: nameController,
                              validator: (value){
                                  if(value == null || value.trim().isEmpty){
                                    return "please enter your name";
                                  }
                                  return null;
                              },
                            ),
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
                            TextFieldItem(
                              keyboardType: TextInputType.visiblePassword,
                              fieldName: "Password",
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
                            TextFieldItem(

                              fieldName: "Confirmation Password",
                              hintText: "enter your Confirmation password",
                              controller: passwordController,
                              validator: (value){
                                if(value == null || value.trim().isEmpty){
                                  return "please enter your password";
                                }
                                if(value != passwordController.text){
                                  return "password doesn't match";
                                }
                                return null;
                              },
                              isObsecure: isObsecure,
                              keyboardType: TextInputType.visiblePassword,
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
                            TextFieldItem(
                              keyboardType: TextInputType.phone,
                                fieldName: "Mobile Number ",
                                hintText: "enter your mobile number",
                                controller: emailController,
                                validator: (value){
                                  if(value == null || value.trim().isEmpty){
                                    return "please enter your mobile number";
                                  }
                                  if(value.length!=11){
                                    return "invalid number";
                                  }
                                  return null;
                                }
                            ),
                            Padding(padding: EdgeInsets.only(top: 35.h),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.whiteColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(15.r))
                                  ),
                                ),
                                onPressed: (){
                                  if(formKey.currentState!.validate()){}
                                },
                                child: SizedBox(
                                  height: 64.h,
                                  width: 398.w,
                                  child: Center(
                                    child: Text("Sign up",style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                      color: AppColors.primaryColor,fontSize: 20.sp,
                                    ),
                                    ),
                                  ),
                                ) ,
                              ),
                            )


                          ],

                    ))
                  ],
              ),
            )
          ],
          ),
        ),
      ),
    );
  }
}
