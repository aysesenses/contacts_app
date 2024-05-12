import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ShowProfilAvatar extends StatelessWidget {
  const ShowProfilAvatar({super.key, required this.avatarText});

  final String avatarText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SvgPicture.asset(
            "assets/svg/profil.svg",
            width: 120,
          ),
          const SizedBox(height: 8),
          Text(
            avatarText,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
