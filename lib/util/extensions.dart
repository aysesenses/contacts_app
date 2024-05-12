// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

/// This method should be called on a [BuildContext] and requires a [SnackBar] to be displayed.
///
/// Example:
/// ```dart
/// context.showSnackbar(
///   'This is a snackbar message',
///   Colors.black,
///   Icon(Icons.check),
///   duration: 3,
/// );
/// ```
extension ContextLoadExtension on BuildContext {
  ScaffoldMessengerState get messenger => ScaffoldMessenger.of(this);

  void showSnackbar(
    String? message,
    Color textColor,
    Widget image, {
    int duration = 2,
  }) {
    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          backgroundColor: Colors.white,
          content: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                image,
                const SizedBox(width: 8),
                Text(
                  '$message',
                  style: TextStyle(color: textColor),
                ),
              ],
            ),
          ),
          duration: Duration(seconds: duration),
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            side: BorderSide(color: Colors.grey.shade200),
          ),
        ),
      );
  }

  void get hideKeyboard => FocusScope.of(this).requestFocus(FocusNode());
}
