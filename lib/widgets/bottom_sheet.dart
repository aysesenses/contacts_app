// ignore_for_file: public_member_api_docs

import 'package:contacts_app/widgets/tab_bar.dart';
import 'package:flutter/material.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({
    super.key,
    required this.onCancelPressed,
    required this.onDonePressed,
    required this.bottomSheetContent,
    required this.isSmallBottomSheet,
  });
  final VoidCallback onCancelPressed;
  final VoidCallback onDonePressed;

  final Widget bottomSheetContent;
  final bool isSmallBottomSheet;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: !isSmallBottomSheet
          ? MediaQuery.of(context).size.height * 0.95
          : MediaQuery.of(context).size.height * 0.4,
      decoration: _boxDecoration(),
      child: Column(
        mainAxisAlignment: !isSmallBottomSheet ? MainAxisAlignment.start : MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!isSmallBottomSheet)
            TabBarWidget(
              title: 'New Contact',
              onCancelPressed: onCancelPressed,
              onDonePressed: onDonePressed,
            )
          else
            const SizedBox(),
          bottomSheetContent
        ],
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    );
  }
}
