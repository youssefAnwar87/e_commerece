import 'package:e_commerece/domain/entities/UserEntity.dart';

class AuthresultEntity{
  UserEntity? userEntity;
  String? token;

  AuthresultEntity({this.userEntity,this.token});
}