// ignore_for_file: public_member_api_docs

import 'package:contacts_app/core/component/base_text_field.dart';
import 'package:contacts_app/product/generated/assets.gen.dart';
import 'package:contacts_app/widgets/show_avatar.dart';
import 'package:contacts_app/widgets/show_snackBar.dart';
import 'package:contacts_app/widgets/tab_bar.dart';
import 'package:flutter/material.dart';

class UserAddForm extends StatefulWidget {
  const UserAddForm({
    super.key,
    required this.onAddUser,
    required this.onCancelPressed,
    required this.onDonePressed,
  });
  final Future<bool?> Function(String, String, String, String?) onAddUser;

  final VoidCallback onCancelPressed;
  final VoidCallback onDonePressed;
  @override
  State<UserAddForm> createState() => _UserAddFormState();
}

class _UserAddFormState extends State<UserAddForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TabBarWidget(
                title: 'New Contact',
                onCancelPressed: widget.onCancelPressed,
                onActionPressed: () async => _addUser(context),
                actionButtonText: 'Done',
              ),
              const ShowProfilAvatar(
                avatarText: 'Add Photo',
                imageUrl: null,
              ),
              BaseTextField(
                hint: 'First name',
                controller: firstNameController,
              ),
              BaseTextField(
                hint: 'Last name',
                controller: lastNameController,
              ),
              BaseTextField(
                hint: 'Phone number',
                controller: phoneNumberController,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _addUser(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      final success = await widget.onAddUser(
        firstNameController.text,
        lastNameController.text,
        phoneNumberController.text,
        null,
      );

      if (success != null) {
        if (success) {
          await ShowBaseSnackBar.show(
            context: context,
            message: 'Snackbar message',
            textColor: Colors.green,
            image: Assets.svg.iconAdd.svg(),
            duration: 3,
          );
        } else {}
      }
    } else {}
  }
}
