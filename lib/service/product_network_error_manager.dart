// ignore_for_file: public_member_api_docs

import 'dart:io';
import 'package:flutter/widgets.dart';

/// Manage your network error with screen
class ProductNetworkErrorManager {
  ProductNetworkErrorManager(this.context);
  final BuildContext context;

  void handleError(int value) {
    if (value == HttpStatus.unauthorized) {
      debugPrint('ProductNetworkErrorManager : HttpStatus unauthorized ');
    } else if (value == HttpStatus.badGateway) {
      debugPrint('ProductNetworkErrorManager : HttpStatus badGateway');
    }
  }
}
