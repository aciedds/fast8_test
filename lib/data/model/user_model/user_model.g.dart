// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      isEmailVerified: json['isEmailVerified'] as bool?,
      email: json['email'] as String?,
      dob: json['dob'] as String?,
      gender: json['gender'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'isEmailVerified': instance.isEmailVerified,
      'dob': instance.dob,
      'gender': instance.gender,
      'phoneNumber': instance.phoneNumber,
    };
