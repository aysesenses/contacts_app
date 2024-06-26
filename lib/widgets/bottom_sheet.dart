// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({
    super.key,
    required this.bottomSheetContent,
  });

  final Widget bottomSheetContent;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.95,
      decoration: _boxDecoration(context),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [bottomSheetContent],
      ),
    );
  }

  BoxDecoration _boxDecoration(BuildContext context) {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: context.border.normalRadius,
        topRight: context.border.normalRadius,
      ),
    );
  }
}
