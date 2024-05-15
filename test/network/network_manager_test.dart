import 'package:contacts_app/model/add_user/base_user_model_request.dart';
import 'package:contacts_app/model/base_response_model.dart';
import 'package:contacts_app/model/base_user_response_model.dart';
import 'package:contacts_app/model/get_user/user_response.dart';
import 'package:contacts_app/product/init/config/app_environment.dart';
import 'package:contacts_app/service/api_service_manager.dart';
import 'package:contacts_app/service/product_service_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vexana/vexana.dart';

void main() {
  late final ProductNetworkManager manager;
  setUp(() {
    AppEnvironment.general();
    manager = ProductNetworkManager.base();
  });

  test('GET users items from api', () async {
    final response = await manager.send<UserResponse, UserResponse>(
      ProductServicePath.user.value,
      parseModel: UserResponse(),
      method: RequestType.GET,
      queryParameters: {'skip': 0, 'take': 10, 'search': ''},
    );

    debugPrint(response.data?.data?.users.toString());

    expect(response.data?.data?.users, isNotNull);
  });

  test('POST user api', () async {
    final response = await manager.send<BaseResponseModel, BaseResponseModel>(
      ProductServicePath.user.value,
      parseModel: BaseResponseModel(),
      method: RequestType.POST,
      data: BaseUserModelRequest(
        firstName: 'ayse4',
        lastName: 'senses4',
        phoneNumber: '055555555',
        profileImageUrl:
            'http://146.59.52.68:11235/images/2ba08b69-3184-4001-92e1-e3b770a76ca9.png',
      ),
    );

    expect(response.data?.success, true);
  });

  test('DELETE user from api', () async {
    final response = await manager.send<BaseResponseModel, BaseResponseModel>(
      ProductServicePath.user.withQuery('66436da4720f4dd266a3b623'),
      parseModel: BaseResponseModel(),
      method: RequestType.DELETE,
    );

    expect(response.error?.model?.messages, {'User NotFound'});
  });

  test('PUT user from api', () async {
    final response = await manager.send<BaseUserResponseModel, BaseUserResponseModel>(
      ProductServicePath.user.withQuery('66436da4720f4dd266a3b623'),
      parseModel: BaseUserResponseModel(),
      method: RequestType.PUT,
      data: BaseUserModelRequest(
        firstName: 'ayseUpdate',
        lastName: 'senses',
        phoneNumber: '055555555',
        profileImageUrl:
            'http://146.59.52.68:11235/images/2ba08b69-3184-4001-92e1-e3b770a76ca9.png',
      ),
    );

    expect(response.error?.model?.messages, {'User NotFound'});
  });

  test('Success PUT user from api', () async {
    final response = await manager.send<BaseUserResponseModel, BaseUserResponseModel>(
      ProductServicePath.user.withQuery('66436a89720f4dd266a3b613'),
      parseModel: BaseUserResponseModel(),
      method: RequestType.PUT,
      data: BaseUserModelRequest(
        firstName: 'ayseUpdate2',
        lastName: 'senses',
        phoneNumber: '055555555',
        profileImageUrl:
            'http://146.59.52.68:11235/images/2ba08b69-3184-4001-92e1-e3b770a76ca9.png',
      ),
    );

    expect(response.data?.data, isNotNull);
  });
}
