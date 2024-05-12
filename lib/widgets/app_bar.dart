// ignore_for_file: public_member_api_docs

import 'package:contacts_app/util/assets_constant.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  const AppBarWidget({
    super.key,
    required this.appTitle,
    required this.onAddButtonPressed,
  });

  final String appTitle;
  final VoidCallback? onAddButtonPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        appTitle,
        style: const TextStyle(color: Colors.black, fontSize: 24),
      ),
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      actions: [
        IconButton(
          icon: Assets.svgImages.iconAdd.svg(),
          onPressed: onAddButtonPressed,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
