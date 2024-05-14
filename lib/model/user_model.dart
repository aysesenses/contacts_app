// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'user_model.g.dart';

/// User Model class
@JsonSerializable()
class UserModel extends INetworkModel<UserModel> with EquatableMixin {
  /// User Model properties
  UserModel({
    this.id,
    this.createdAt,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.profileImageUrl,
  });

  /// Get user from json
  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  final String? id;
  final DateTime? createdAt;
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;
  final String? profileImageUrl;

  @override
  List<Object?> get props => [id, createdAt, firstName, lastName, phoneNumber, profileImageUrl];

  /// User model to map object
  @override
  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  @override
  UserModel fromJson(Map<String, dynamic> json) {
    return _$UserModelFromJson(json);
  }

  UserModel copyWith({
    String? id,
    DateTime? createdAt,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? profileImageUrl,
  }) {
    return UserModel(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
    );
  }
}
