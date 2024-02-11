import 'package:dartz/dartz.dart';
import 'package:e_commerece/data/Api/base_error.dart';
import 'package:e_commerece/data/model/response/RegisterResponse.dart';
import 'package:e_commerece/domain/entities/AuthReusltEntity.dart';
import 'package:e_commerece/domain/repository/auth_repository/data_source/auth_remote_data_source.dart';
import 'package:e_commerece/domain/repository/auth_repository/repository/auth_repository_contract.dart';
import 'package:e_commerece/repository/auth_repository/dataSource/auth_remote_data_source_impl.dart';

class AuthRepositryImpl implements AuthRepositoryContract{
  AuthRemoteDataSource remoteDataSource;
  AuthRepositryImpl({required this.remoteDataSource});
  Future<Either<BaseError, AuthresultEntity>> register(String name, String email, String passowrd, String rePassword, String phone) {
    return remoteDataSource.register(name, email, passowrd, rePassword, phone);
  }
}
   AuthRepositoryContract injectAuthRepository(){
    return AuthRepositryImpl(remoteDataSource: injectAuthRemoteDataSource() );
  }