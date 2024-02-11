import 'package:dartz/dartz.dart';
import 'package:e_commerece/data/Api/base_error.dart';
import 'package:e_commerece/data/model/response/RegisterResponse.dart';
import 'package:e_commerece/domain/entities/AuthReusltEntity.dart';
import 'package:e_commerece/domain/repository/auth_repository/repository/auth_repository_contract.dart';
import 'package:e_commerece/repository/auth_repository/repository/auth_repository_impl.dart';

class RegisterUseCase{
  AuthRepositoryContract repositoryContract;
  RegisterUseCase({required this.repositoryContract});
  Future<Either<BaseError,AuthresultEntity>>invoke(String name, String email, String passowrd, String rePassword, String phone)
  async{
    var eiher = await repositoryContract.register(name, email, passowrd, rePassword, phone);
    return eiher.fold((l){
      return Left(BaseError(errorMessage: l.errorMessage ));
    } ,(response){
      return  Right(response);
    }
    );

  }
}
RegisterUseCase injectRegisterUseCase(){
  return RegisterUseCase(repositoryContract: injectAuthRepository());
}