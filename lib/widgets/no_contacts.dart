// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoContactsWidget extends StatelessWidget {
  const NoContactsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/svg/profil.svg',
          height: 60,
          width: 60,
        ),
        const SizedBox(height: 12),
        const Text(
          'No Contacts',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        const Text(
          'Contacts you’ve added will appear here.',
          style: TextStyle(color: Colors.black),
        ),
        TextButton(
          onPressed: () {},
          child: const Text('Create New Contact'),
        ),
      ],
    );
  }
}
