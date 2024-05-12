import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  const AppBarWidget({
    Key? key,
    required this.appTitle,
    required this.onAddButtonPressed,
  }) : super(key: key);

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
          icon: SvgPicture.asset("assets/svg/icon_add.svg"),
          onPressed: onAddButtonPressed,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
