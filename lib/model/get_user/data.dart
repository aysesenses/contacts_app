// ignore_for_file: public_member_api_docs

import 'package:contacts_app/model/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'data.g.dart';

@JsonSerializable()
class Data extends INetworkModel<Data> with EquatableMixin {
  Data({
    this.users,
  });
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  List<UserModel>? users;

  @override
  Data fromJson(Map<String, dynamic> json) => Data.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$DataToJson(this);

  @override
  List<Object?> get props => [users];

  Data copyWith({
    List<UserModel>? users,
  }) {
    return Data(
      users: users ?? this.users,
    );
  }
}
