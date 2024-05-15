// ignore_for_file: public_member_api_docs

import 'package:contacts_app/model/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'base_user_response_model.g.dart';

@JsonSerializable()
class BaseUserResponseModel extends INetworkModel<BaseUserResponseModel> with EquatableMixin {
  BaseUserResponseModel({
    this.success,
    this.messages,
    this.data,
    this.status,
  });
  factory BaseUserResponseModel.fromJson(Map<String, dynamic> json) =>
      _$BaseUserResponseModelFromJson(json);
  bool? success;
  List<String>? messages;
  UserModel? data;
  int? status;

  @override
  BaseUserResponseModel fromJson(Map<String, dynamic> json) => BaseUserResponseModel.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$BaseUserResponseModelToJson(this);

  @override
  List<Object?> get props => [success, messages, data, status];

  BaseUserResponseModel copyWith({
    bool? success,
    List<String>? messages,
    UserModel? data,
    int? status,
  }) {
    return BaseUserResponseModel(
      success: success ?? this.success,
      messages: messages ?? this.messages,
      data: data ?? this.data,
      status: status ?? this.status,
    );
  }
}
