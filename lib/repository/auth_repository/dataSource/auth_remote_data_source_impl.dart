import 'package:dartz/dartz.dart';
import 'package:e_commerece/data/Api/api_manger.dart';
import 'package:e_commerece/data/Api/base_error.dart';
import 'package:e_commerece/data/model/response/RegisterResponse.dart';
import 'package:e_commerece/domain/entities/AuthReusltEntity.dart';
import 'package:e_commerece/domain/repository/auth_repository/data_source/auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource{
  ApiManger apiManger;
  AuthRemoteDataSourceImpl({required this.apiManger});
  @override
  Future<Either<BaseError,AuthresultEntity>> register(String name, String email, String passowrd, String rePassword, String phone)
  async{
    var either =  await apiManger.register(name, email, passowrd, rePassword, phone);
    return either.fold((l) => Left(BaseError(errorMessage: l.errorMessage)),
            (response) =>Right(response.toAuthResultEntity())
    );
  }

}
  AuthRemoteDataSource injectAuthRemoteDataSource(){
    return AuthRemoteDataSourceImpl(apiManger: ApiManger.getInstance() );

  }
