// ignore_for_file: public_member_api_docs

import 'package:contacts_app/model/get_user/data.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'user_response.g.dart';

/// User Model class
@JsonSerializable()
class UserResponse extends INetworkModel<UserResponse> with EquatableMixin {
  /// User Model properties
  UserResponse({
    this.data,
  });

  /// Get user from json
  factory UserResponse.fromJson(Map<String, dynamic> json) => _$UserResponseFromJson(json);

  final Data? data;

  @override
  List<Object?> get props => [data];

  /// User model to map object
  @override
  Map<String, dynamic> toJson() => _$UserResponseToJson(this);

  @override
  UserResponse fromJson(Map<String, dynamic> json) {
    return _$UserResponseFromJson(json);
  }

  UserResponse copyWith({
    Data? data,
  }) {
    return UserResponse(
      data: data ?? this.data,
    );
  }
}
