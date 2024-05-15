// ignore_for_file: public_member_api_docs

import 'package:contacts_app/product/generated/colors.gen.dart';
import 'package:contacts_app/widgets/network_image/project_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

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
      padding: context.padding.normal * 0.5,
      child: Card(
        elevation: 0,
        color: Colors.white,
        shape: _cardShape(context),
        child: Padding(
          padding: context.padding.normal,
          child: Row(
            children: [
              ProjectNetworkImage(
                url: url,
              ),
              SizedBox(width: context.sized.normalValue),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: context.sized.normalValue),
                  Text(
                    '+$phoneNumber',
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

  RoundedRectangleBorder _cardShape(BuildContext context) {
    return RoundedRectangleBorder(
      borderRadius: context.border.normalBorderRadius,
    );
  }
}
