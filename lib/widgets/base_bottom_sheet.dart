// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

class BaseModalBottomSheet {
  BaseModalBottomSheet._();

  /// Show a general bottom sheet with
  /// [builder] for the dialog
  /// [isDismissible] is false
  /// [enableDrag] is false
  /// [isScrollControlled] is false
  ///
  static Future<T?> show<T>({
    required BuildContext context,
    required WidgetBuilder builder,
  }) async {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: builder,
      enableDrag: false,
      isDismissible: false,
      isScrollControlled: true,
    );
  }
}
