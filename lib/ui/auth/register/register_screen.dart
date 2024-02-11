import 'package:e_commerece/domain/useCase/RegisterUseCase.dart';
import 'package:e_commerece/repository/auth_repository/repository/auth_repository_impl.dart';
import 'package:e_commerece/ui/auth/register/cubit/register_screen_view_model.dart';
import 'package:e_commerece/ui/auth/register/cubit/states.dart';
import 'package:e_commerece/utils/app_colors.dart';
import 'package:e_commerece/utils/dialog_utils.dart';
import 'package:e_commerece/utils/text_field_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = "register screen";

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var viewModel = RegisterScreenViewModel(registerUseCase: injectRegisterUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterScreenViewModel,RegisterStates>(
        bloc: viewModel,
        listener: (context,state){
          if( state is RegisterLoadingState ){
            DialogUtils.showLoading(context, state.loadingMessage ??"waiting..");
          }else if(state is RegisterErrorState ){
            DialogUtils.hideLoading(context);
            DialogUtils.showErrorDialog(context, state.ErrorMessage??"","Error");
          }else if(state is RegisterSuccuessState ){
            DialogUtils.hideLoading(context);
            print("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh");
            DialogUtils.showErrorDialog(context, state.response.userEntity?.name??"","success");
          }

        },
        child: Scaffold(
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
    key : viewModel.formKey,
    child: Column(
    children: [
    TextFieldItem(
    fieldName: "Full Name",
    hintText: "enter your name",
    controller: viewModel.nameController,
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
    controller: viewModel.emailController,
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
    controller: viewModel.passwordController,
    validator: (value){
    if(value == null || value.trim().isEmpty){
    return "please enter your password";
    }
    if(value.trim()!.length < 6 || value.trim()!.length > 30){
    return "password should be >6 & <30";
    }
    return null;
    },
    isObsecure: viewModel.isObsecure,
    suffixIcon: InkWell(

    child: viewModel.isObsecure ? Icon(Icons.visibility_off) :
    Icon(Icons.visibility),
    onTap: (){
    if(viewModel.isObsecure){
      viewModel. isObsecure = false;
    }else{
      viewModel. isObsecure = true;
    }
    setState(() {});
    }
    ),
    ),
    TextFieldItem(

    fieldName: "Confirmation Password",
    hintText: "enter your Confirmation password",
    controller: viewModel.confirmationPasswordController,
    validator: (value){
    if(value == null || value.trim().isEmpty){
    return "please enter your password";
    }
    if(value != viewModel.confirmationPasswordController.text){
    return "password doesn't match";
    }
    return null;
    },
    isObsecure: viewModel.isObsecure,
    keyboardType: TextInputType.visiblePassword,
    suffixIcon: InkWell(

    child: viewModel.isObsecure ? Icon(Icons.visibility_off) :
    Icon(Icons.visibility),
    onTap: (){
    if(viewModel.isObsecure){
      viewModel.isObsecure = false;
    }else{
      viewModel. isObsecure = true;
    }
    setState(() {});
    }
    ),
    ),
    TextFieldItem(
    keyboardType: TextInputType.phone,
    fieldName: "Mobile Number ",
    hintText: "enter your mobile number",
    controller: viewModel.phoneController,
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
    if(viewModel. formKey.currentState!.validate()){
      viewModel.register();
    }
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
    ),
    );
  }
}
