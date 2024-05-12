// ignore_for_file: public_member_api_docs

import 'package:contacts_app/product/generated/colors.gen.dart';
import 'package:flutter/material.dart';

class ItemUserWidget extends StatelessWidget {
  const ItemUserWidget({
    super.key,
    required this.url,
    required this.userName,
    required this.phoneNumber,
  });

  final String url;
  final String userName;
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Card(
        shape: _cardShape(),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              CircleAvatar(
                radius: 17,
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage(url),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    phoneNumber,
                    style: const TextStyle(color: ColorName.gray),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  RoundedRectangleBorder _cardShape() {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    );
  }
}
