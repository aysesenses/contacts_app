// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class SmallBottomSheetWidget extends StatelessWidget {
  const SmallBottomSheetWidget({
    super.key,
    required this.bottomSheetContent,
  });

  final Widget bottomSheetContent;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: _boxDecoration(context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
