import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String? id;
  final String? name;
  final String? email;
  final bool? isEmailVerified;
  final String? dob;
  final String? gender;
  final String? phoneNumber;

  UserModel({
    required this.id,
    required this.name,
    required this.isEmailVerified,
    required this.email,
    required this.dob,
    required this.gender,
    required this.phoneNumber,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
