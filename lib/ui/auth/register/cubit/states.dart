import 'package:e_commerece/data/model/response/RegisterResponse.dart';

abstract class RegisterStates{}
 class RegisterLoadingState extends RegisterStates{
  String? loadingMessage;
  RegisterLoadingState({required this.loadingMessage});
 }
 class RegisterErrorState extends RegisterStates{

   String? ErrorMessage;
   RegisterErrorState({required this.ErrorMessage});
 }
 class RegisterSuccuessState extends RegisterStates{
  RegisterResponse response;
  RegisterSuccuessState({required this.response});

 }
 class RegisterInitialState extends RegisterStates{}