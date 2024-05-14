// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'error_response.g.dart';

@JsonSerializable()
class ErrorResponse extends INetworkModel<ErrorResponse> with EquatableMixin {
  ErrorResponse({
    this.success,
    this.messages,
    this.status,
  });

  @override
  factory ErrorResponse.fromJson(Map<String, dynamic> json) => _$ErrorResponseFromJson(json);

  final bool? success;
  final List<String>? messages;
  final int? status;

  @override
  List<Object?> get props => [success, messages, status];

  @override
  Map<String, dynamic> toJson() => _$ErrorResponseToJson(this);

  @override
  ErrorResponse fromJson(Map<String, dynamic> json) {
    return _$ErrorResponseFromJson(json);
  }
}
