import 'package:flutter/material.dart';

extension ContextLoadExtension on BuildContext {
  ScaffoldMessengerState get messenger => ScaffoldMessenger.of(this);
  showSnackbar(
    String? message,
    Color textColor,
    dynamic image, {
    int duration = 2,
  }) {
    messenger.hideCurrentSnackBar();
    messenger.showSnackBar(
      SnackBar(
        backgroundColor: Colors.white,
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              image,
              const SizedBox(width: 8),
              Text(
                "$message",
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
