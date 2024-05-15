// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';
part 'user_add_request.g.dart';

@JsonSerializable()
class BaseUserModelRequest extends INetworkModel<BaseUserModelRequest> with EquatableMixin {
  BaseUserModelRequest({
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.profileImageUrl,
  });

  factory BaseUserModelRequest.fromJson(Map<String, dynamic> json) =>
      _$BaseUserModelRequestFromJson(json);

  final String? firstName;
  final String? lastName;
  final String? phoneNumber;
  final String? profileImageUrl;

  @override
  BaseUserModelRequest fromJson(Map<String, dynamic> json) => BaseUserModelRequest.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$BaseUserModelRequestToJson(this);

  @override
  List<Object?> get props => [firstName, lastName, phoneNumber, profileImageUrl];

  BaseUserModelRequest copyWith({
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? profileImageUrl,
  }) {
    return BaseUserModelRequest(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
    );
  }
}
