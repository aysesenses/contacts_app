// ignore_for_file: public_member_api_docs

import 'package:contacts_app/widgets/network_image/image_cached/custom_network_image.dart';
import 'package:flutter/material.dart';

class ProjectNetworkImage extends StatelessWidget {
  const ProjectNetworkImage({required this.url, super.key});

  final String? url;
  
  @override
  Widget build(BuildContext context) {
    return CustomNetworkImage(
      imageUrl: url,
    );
  }
}
