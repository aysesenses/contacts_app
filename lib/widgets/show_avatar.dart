// ignore_for_file: public_member_api_docs

import 'package:contacts_app/widgets/network_image/project_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ShowProfilAvatar extends StatelessWidget {
  const ShowProfilAvatar(
      {super.key, required this.avatarText, required this.imageUrl, this.radius});

  final String avatarText;
  final String? imageUrl;
  final double? radius;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          if (imageUrl != null)
            ProjectNetworkImage(
              url: imageUrl,
              radius: radius,
            )
          else
            SvgPicture.asset(
              'assets/svg/profil.svg',
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
