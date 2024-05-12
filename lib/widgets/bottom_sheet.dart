import 'package:contacts_app/widgets/tab_bar.dart';
import 'package:flutter/material.dart';

class BottomSheetWidget extends StatelessWidget {
  final VoidCallback onCancelPressed;
  final VoidCallback onDonePressed;

  final Widget bottomSheetContent;
  final bool isSmallBottomSheet;

  const BottomSheetWidget({
    super.key,
    required this.onCancelPressed,
    required this.onDonePressed,
    required this.bottomSheetContent,
    required this.isSmallBottomSheet,
  });

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
          !isSmallBottomSheet
              ? TabBarWidget(
                  title: "New Contact",
                  onCancelPressed: onCancelPressed,
                  onDonePressed: onDonePressed,
                )
              : const SizedBox(),
          bottomSheetContent
        ],
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
    );
  }
}
