import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChoseProfilPhoto extends StatefulWidget {
  const ChoseProfilPhoto(
      {super.key,
      required this.galleryPressed,
      required this.cameraPressed,
      required this.cancelPressed});

  final VoidCallback galleryPressed;
  final VoidCallback cameraPressed;
  final VoidCallback cancelPressed;

  @override
  State<ChoseProfilPhoto> createState() => _ChoseProfilPhotoState();
}

class _ChoseProfilPhotoState extends State<ChoseProfilPhoto> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildCard("assets/svg/icon_camera.svg", "Camera", false, widget.cameraPressed),
          _buildCard("assets/svg/icon_galery.svg", "Gallery", false, widget.galleryPressed),
          _buildCard(null, null, true, widget.cancelPressed),
        ],
      ),
    );
  }

  GestureDetector _buildCard(
      String? assetName, String? text, bool isCancel, VoidCallback callback) {
    return GestureDetector(
      onTap: () {
        callback();
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(color: Colors.grey.shade200),
        ),
        elevation: 0,
        color: const Color(0xfff4f4f4),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              isCancel ? const SizedBox() : SvgPicture.asset(assetName!),
              const SizedBox(width: 8),
              isCancel
                  ? TextButton(
                      onPressed: (() => _clickCancel()),
                      child: const Text(
                        "Cancel",
                        style: TextStyle(fontSize: 24),
                      ),
                    )
                  : Text(
                      text!,
                      style: const TextStyle(fontSize: 24),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  _clickCancel() => Navigator.of(context).pop();
}
