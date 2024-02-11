import 'package:dartz/dartz.dart';
import 'package:e_commerece/data/Api/base_error.dart';
import 'package:e_commerece/domain/entities/AuthReusltEntity.dart';

abstract class AuthRemoteDataSource{
   Future <Either<BaseError,AuthresultEntity>> register(String name,String email,String passowrd,String rePassword,
      String phone);
   //login
  }