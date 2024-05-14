import 'package:contacts_app/model/user_model.dart';
import 'package:contacts_app/model/user_response.dart';
import 'package:contacts_app/product/init/config/app_environment.dart';
import 'package:contacts_app/service/api_service_manager.dart';
import 'package:contacts_app/service/product_service_path.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vexana/vexana.dart';

void main() {
  final dio = Dio();

  late final ProductNetworkManager manager;
  setUp(() {
    AppEnvironment.general();
    manager = ProductNetworkManager.base();
  });
  test('get users items from api', () async {
    final response = await manager.send<UserModel, List<UserModel>>(
      ProductServicePath.user.value,
      parseModel: UserModel(),
      data: UserResponse(),
      method: RequestType.GET,
    );

    debugPrint(response.toString());

    expect(response.data, isNotNull);
  });

  const baseUrl = 'http://146.59.52.68:11235/api';
  const apiKey = '3fe05d42-0738-46fd-91a7-cd5aa2b5b5a6';
  const skip = 0;
  const take = 10;

  test('get users items from dio', () async {
    final response = await dio.get(
      '$baseUrl/User',
      queryParameters: {'skip': skip, 'take': take},
      options: Options(headers: {'ApiKey': apiKey}),
    );

    expect(response.data, null);
  });
}
