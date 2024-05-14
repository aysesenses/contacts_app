// ignore_for_file: public_member_api_docs

import 'package:contacts_app/model/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'user_response.g.dart';

/// User Model class
@JsonSerializable()
class UserResponse extends INetworkModel<UserResponse> with EquatableMixin {
  /// User Model properties
  UserResponse({
    this.users,
  });

  /// Get user from json
  factory UserResponse.fromJson(Map<String, dynamic> json) => _$UserResponseFromJson(json);

  final List<UserModel>? users;

  @override
  List<Object?> get props => [users];

  /// User model to map object
  @override
  Map<String, dynamic> toJson() => _$UserResponseToJson(this);

  @override
  UserResponse fromJson(Map<String, dynamic> json) {
    return _$UserResponseFromJson(json);
  }

  UserResponse copyWith({
    List<UserModel>? users,
  }) {
    return UserResponse(
      users: users ?? this.users,
    );
  }
}
