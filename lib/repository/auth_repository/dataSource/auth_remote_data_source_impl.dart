import 'package:e_commerece/data/Api/api_manger.dart';
import 'package:e_commerece/data/model/response/RegisterResponse.dart';
import 'package:e_commerece/repository/auth_repository/auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource{
  ApiManger apiManger;
  AuthRemoteDataSourceImpl({required this.apiManger});
  @override
  Future<RegisterResponse> register(String name, String email, String passowrd, String rePassword, String phone) async{
    var response =  await apiManger.register(name, email, passowrd, rePassword, phone);
    return response;
  }

}
  AuthRemoteDataSource injectAuthRemoteDataSource(){
    return AuthRemoteDataSourceImpl(apiManger: ApiManger.getInstance() );

  }
