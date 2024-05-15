// ignore_for_file: public_member_api_docs

import 'package:contacts_app/model/add_user/base_user_model_request.dart';
import 'package:contacts_app/model/base_response_model.dart';
import 'package:contacts_app/model/base_user_response_model.dart';
import 'package:contacts_app/model/error_response.dart';
import 'package:contacts_app/model/get_user/user_response.dart';
import 'package:contacts_app/model/user_model.dart';
import 'package:contacts_app/service/product_service_path.dart';
import 'package:contacts_app/service/repository/user_service_repository.dart';
import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

class UserService extends UserServiceRepository {
  UserService(INetworkManager<ErrorResponse> networkManager) : _networkManager = networkManager;

  final INetworkManager<ErrorResponse> _networkManager;

  @override
  Future<List<UserModel>?> getUsers() async {
    final response = await _networkManager.send<UserResponse, UserResponse>(
      ProductServicePath.user.value,
      parseModel: UserResponse(),
      method: RequestType.GET,
      queryParameters: {'skip': 0, 'take': 10, 'search': ''},
    );

    debugPrint(response.data?.data?.users.toString());

    return response.data?.data?.users ?? [];
  }

  @override
  Future<bool?> addUser(
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? profileImageUrl,
  ) async {
    final response = await _networkManager.send<BaseUserResponseModel, BaseUserResponseModel>(
      ProductServicePath.user.value,
      parseModel: BaseUserResponseModel(),
      method: RequestType.POST,
      data: BaseUserModelRequest(
        firstName: firstName,
        lastName: lastName,
        phoneNumber: phoneNumber,
        profileImageUrl: profileImageUrl,
      ),
    );

    await getUsers();
    return response.data?.success;
  }

  @override
  Future<bool?> deleteUser(String userId) async {
    final response = await _networkManager.send<BaseResponseModel, BaseResponseModel>(
      ProductServicePath.user.withQuery(userId),
      parseModel: BaseResponseModel(),
      method: RequestType.DELETE,
    );
    return response.data?.success;
  }
}
