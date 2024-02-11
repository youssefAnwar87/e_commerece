import 'package:e_commerece/data/model/response/RegisterResponse.dart';
import 'package:e_commerece/domain/entities/AuthReusltEntity.dart';

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
  AuthresultEntity response;
  RegisterSuccuessState({required this.response});

 }
 class RegisterInitialState extends RegisterStates{}