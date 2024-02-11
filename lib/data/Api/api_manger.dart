import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerece/data/Api/api_constants.dart';
import 'package:e_commerece/data/Api/base_error.dart';
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
   Future <Either<BaseError,RegisterResponse>> register(String name,String email,String passowrd,String rePassword,
      String phone) async {
     final connectivityResult = await (Connectivity().checkConnectivity());
     if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
    Uri url = Uri.https(ApiConstants.baseUrl,ApiConstants.registerApi);
    var requestBody =  RegisterRequest(
        email: email,
      name: name,
      password: passowrd,
      phone: phone,
      rePassword: rePassword
    );
    var response = await http.post(url,body: requestBody.toJson() );
    var registerResponse= RegisterResponse.fromJson( jsonDecode(response.body) );
    if(response.statusCode ==200 && response.statusCode < 300 ) {
      return Right(registerResponse);
    }else{
      return Left(BaseError(errorMessage: registerResponse.error != null ?  registerResponse.error!.msg   :
          registerResponse.message
      )  );
    }
     }else{
       return Left(BaseError(errorMessage: "Please check internet connection"));
     }


  }
}