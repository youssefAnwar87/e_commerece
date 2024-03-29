import 'package:e_commerece/data/model/response/Error.dart';
import 'package:e_commerece/domain/entities/AuthReusltEntity.dart';

import 'UserDto.dart';

/// message : "success"
/// user : {"name":"Ahmed Abd Al-Muti","email":"yousseftest@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1YzE5ZGZlMDkzZWFhNGJkNjczMWQzZSIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzA3MTg3NzExLCJleHAiOjE3MTQ5NjM3MTF9.yvDVKQZX7_efdpXZ5v_3sFIGkm4qW2EasT24TNa8Ceo"

class RegisterResponse {
  RegisterResponse({
      this.message, 
      this.user, 
      this.token,
    this.error,
    this.statusMsg
  });

  RegisterResponse.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    error = json['errors'] != null ? Errors.fromJson(json['errors']) : null;
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    token = json['token'];
  }
  String? message;
  UserDto? user;
  String? token;
  Errors? error;
  String? statusMsg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['statusMsg'] = statusMsg;
    map['errors'] = error;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }
  AuthresultEntity toAuthResultEntity(){
    return AuthresultEntity(
      token: token,
      userEntity: user?.toUserEntity()
    );
  }

}