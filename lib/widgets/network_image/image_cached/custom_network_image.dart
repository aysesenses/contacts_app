// ignore_for_file: public_member_api_docs

import 'package:cached_network_image/cached_network_image.dart';
import 'package:contacts_app/widgets/network_image/image_cached/custom_mem_cached.dart';
import 'package:flutter/material.dart';

/// It will provide to image caching and image loading from network
class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    super.key,
    this.imageUrl,
    this.emptyWidget,
    this.memCache = const CustomMemCache(height: 200, width: 200),
    this.boxFit = BoxFit.cover,
    this.loadingWidget,
    this.size,
  });

  ///  Image source address
  final String? imageUrl;

  /// When image is not available then it will show empty widget
  final Widget? emptyWidget;

  /// When image is loading then it will show loading widget
  final Widget? loadingWidget;

  /// Default value is [CustomMemCache(height: 200, width: 200)]
  final CustomMemCache memCache;

  /// Default value is [BoxFit.cover]
  final BoxFit boxFit;

  /// Image size
  final Size? size;

  @override
  Widget build(BuildContext context) {
    final url = imageUrl;
    if (url == null || url.isEmpty) return emptyWidget ?? const SizedBox();
    return CachedNetworkImage(
      imageUrl: url,
      memCacheHeight: memCache.height,
      memCacheWidth: memCache.width,
      fit: boxFit,
      width: size?.width,
      height: size?.height,
      progressIndicatorBuilder: (context, url, progress) {
        return loadingWidget ??
            const Center(
              child: CircularProgressIndicator(),
            );
      },
      errorWidget: (context, url, error) {
        return emptyWidget ?? const SizedBox();
      },
    );
  }
}
