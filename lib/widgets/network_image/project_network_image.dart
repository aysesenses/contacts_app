// ignore_for_file: public_member_api_docs

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class ProjectNetworkImage extends StatelessWidget {
  const ProjectNetworkImage({required this.url, super.key, this.radius});

  final String? url;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius != null ? context.border.highRadius.x * 1.5 : radius,
      backgroundImage: CachedNetworkImageProvider(url!),
    );
  }
}
