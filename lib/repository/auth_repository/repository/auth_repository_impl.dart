import 'package:e_commerece/data/model/response/RegisterResponse.dart';
import 'package:e_commerece/repository/auth_repository/auth_remote_data_source.dart';
import 'package:e_commerece/repository/auth_repository/auth_repository_contract.dart';
import 'package:e_commerece/repository/auth_repository/dataSource/auth_remote_data_source_impl.dart';

class AuthRepositryImpl implements AuthRepositoryContract{
  AuthRemoteDataSource remoteDataSource;
  AuthRepositryImpl({required this.remoteDataSource});
  Future<RegisterResponse> register(String name, String email, String passowrd, String rePassword, String phone) {
    return remoteDataSource.register(name, email, passowrd, rePassword, phone);
  }
}
   AuthRepositoryContract injectAuthRepository(){
    return AuthRepositryImpl(remoteDataSource: injectAuthRemoteDataSource() );
  }
