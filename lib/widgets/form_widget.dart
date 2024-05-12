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
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              const ShowProfilAvatar(
                avatarText: "Add Photo",
              ),
              BaseTextField(
                context,
                hint: "First name",
              ),
              BaseTextField(
                context,
                hint: "Last name",
              ),
              BaseTextField(
                context,
                hint: "Phone number",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
