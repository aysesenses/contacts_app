// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({
    super.key,
    required this.onCancelPressed,
    required this.onActionPressed,
    this.title,
    required this.actionButtonText,
  });

  final String? title;
  final String actionButtonText;

  final VoidCallback? onCancelPressed;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: onCancelPressed,
          child: const Text('Cancel'),
        ),
        Text(
          title ?? '',
          style: _boldText(),
        ),
        TextButton(
          onPressed: onActionPressed,
          child: Text(
            actionButtonText,
            style: _boldText(),
          ),
        )
      ],
    );
  }

  TextStyle _boldText() {
    return const TextStyle(
      fontWeight: FontWeight.bold,
    );
  }
}
