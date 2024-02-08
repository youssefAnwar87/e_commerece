import 'dart:convert';

import 'package:e_commerece/data/Api/api_constants.dart';
import 'package:e_commerece/data/model/request/RegisterRequest.dart';
import 'package:e_commerece/data/model/response/RegisterResponse.dart';
import 'package:http/http.dart' as http;
// https://ecommerce.routemisr.com/api/v1/auth/signup
class ApiManger{
  ApiManger._();
  static ApiManger? instance;
  static ApiManger getInstance(){
    instance ??= ApiManger._();
    return instance!;
  }
   Future <RegisterResponse> register(String name,String email,String passowrd,String rePassword,
      String phone) async {
    Uri url = Uri.https(ApiConstants.baseUrl,ApiConstants.registerApi);
    var requestBody =  RegisterRequest(
        email: email,
      name: name,
      password: passowrd,
      phone: phone,
      rePassword: rePassword
    );
    var response = await http.post(url,body: requestBody.toJson() );
    return RegisterResponse.fromJson( jsonDecode(response.body) );

  }
}