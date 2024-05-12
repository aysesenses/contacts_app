// ignore_for_file: public_member_api_docs

import 'package:contacts_app/core/component/base_text_field.dart';
import 'package:contacts_app/widgets/show_avatar.dart';
import 'package:flutter/material.dart';

class UserAddForm extends StatefulWidget {
  const UserAddForm({super.key});

  @override
  State<UserAddForm> createState() => _UserAddFormState();
}

class _UserAddFormState extends State<UserAddForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            children: const <Widget>[
              ShowProfilAvatar(
                avatarText: 'Add Photo',
              ),
              BaseTextField(
                hint: 'First name',
              ),
              BaseTextField(
                hint: 'Last name',
              ),
              BaseTextField(
                hint: 'Phone number',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
