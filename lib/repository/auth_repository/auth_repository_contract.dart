import 'package:e_commerece/data/model/response/RegisterResponse.dart';

abstract class AuthRepositoryContract{
  Future <RegisterResponse> register(String name,String email,String passowrd,String rePassword,
      String phone);
//login
}
