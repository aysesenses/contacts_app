// ignore_for_file: public_member_api_docs

import 'package:contacts_app/model/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'base_response_model.g.dart';

@JsonSerializable()
class BaseResponseModel extends INetworkModel<BaseResponseModel> with EquatableMixin {
  BaseResponseModel({
    this.success,
    this.messages,
    this.data,
    this.status,
  });
  factory BaseResponseModel.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseModelFromJson(json);
  bool? success;
  List<String>? messages;
  dynamic data;
  int? status;

  @override
  BaseResponseModel fromJson(Map<String, dynamic> json) => BaseResponseModel.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$BaseResponseModelToJson(this);

  @override
  List<Object?> get props => [success, messages, data, status];

  BaseResponseModel copyWith({
    bool? success,
    List<String>? messages,
    dynamic data,
    int? status,
  }) {
    return BaseResponseModel(
      success: success ?? this.success,
      messages: messages ?? this.messages,
      data: data ?? this.data,
      status: status ?? this.status,
    );
  }
}
