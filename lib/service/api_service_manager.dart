// ignore_for_file: public_member_api_docs

import 'dart:io';

import 'package:contacts_app/model/error_response.dart';
import 'package:contacts_app/product/init/config/app_environment.dart';
import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

const skip = 0;
const take = 10;

/// Product network manager
class ProductNetworkManager extends NetworkManager<ErrorResponse> {
  ProductNetworkManager.base()
      : super(
          errorModel: ErrorResponse(),
          isEnableLogger: true,
          options: BaseOptions(
            baseUrl: AppEnvironmentItems.baseUrl.value,
            headers: {'ApiKey': AppEnvironmentItems.apiKey.value},
            queryParameters: {'skip': 0, 'take': 10},
          ),
        );

  /// Handle error
  /// [onErrorStatus] is error status code [HttStatus]
  void listenErrorState({required ValueChanged<int> onErrorStatus}) {
    interceptors.add(
      InterceptorsWrapper(
        onError: (e, handler) {
          onErrorStatus(e.response?.statusCode ?? HttpStatus.notFound);
          return handler.next(e);
        },
      ),
    );
  }
}
