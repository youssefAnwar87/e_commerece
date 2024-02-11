import 'package:dartz/dartz.dart';
import 'package:e_commerece/data/Api/api_manger.dart';
import 'package:e_commerece/domain/repository/auth_repository/repository/auth_repository_contract.dart';
import 'package:e_commerece/domain/useCase/RegisterUseCase.dart';
import 'package:e_commerece/ui/auth/register/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreenViewModel extends Cubit<RegisterStates>{
  RegisterUseCase registerUseCase;
  RegisterScreenViewModel({required this.registerUseCase}):super(RegisterInitialState());
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmationPasswordController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isObsecure = true;
   void register() async{
     if( formKey.currentState!.validate()) {
       emit(RegisterLoadingState(loadingMessage: "Loading..."));
         var either = await registerUseCase.invoke(
             nameController.text, emailController.text, passwordController.text
             , confirmationPasswordController.text, phoneController.text);
         either.fold((l) {
           emit(RegisterErrorState(ErrorMessage: l.errorMessage));
         }, (r) {
             emit(RegisterSuccuessState(response: r));
         });



     }
   }


}