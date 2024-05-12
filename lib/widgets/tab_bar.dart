// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({
    super.key,
    required this.onCancelPressed,
    required this.onDonePressed,
    this.title,
  });

  final String? title;
  final VoidCallback? onCancelPressed;
  final VoidCallback? onDonePressed;

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
          onPressed: onCancelPressed,
          child: Text(
            'Done',
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
