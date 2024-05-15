import 'package:flutter/material.dart';

/// Base SnackBar
class ShowBaseSnackBar {
  ShowBaseSnackBar._();

  static Future<void> show<T>({
    required BuildContext context,
    required String? message,
    required Color textColor,
    required Widget image,
    int duration = 2,
  }) async {
    ScaffoldMessenger.of(context).showSnackBar(
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
}
