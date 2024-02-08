import 'package:e_commerece/data/Api/api_manger.dart';
import 'package:e_commerece/repository/auth_repository/auth_repository_contract.dart';
import 'package:e_commerece/ui/auth/register/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreenViewModel extends Cubit<RegisterStates>{
  AuthRepositoryContract repositoryContract;
  RegisterScreenViewModel({required this.repositoryContract}):super(RegisterInitialState());
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
       try{
         var response = await repositoryContract.register(
             nameController.text, emailController.text, passwordController.text
             , confirmationPasswordController.text, phoneController.text);
         if (response.message != "success") {
           emit(RegisterErrorState(ErrorMessage: response.message));
         } else {
           emit(RegisterSuccuessState(response: response));
         }
       }catch(e){
         emit(RegisterErrorState(ErrorMessage: e.toString()));

       }

     }
   }


}