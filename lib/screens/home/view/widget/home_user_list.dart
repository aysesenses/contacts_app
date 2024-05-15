// ignore_for_file: public_member_api_docs

import 'package:contacts_app/model/user_model.dart';
import 'package:contacts_app/product/generated/colors.gen.dart';
import 'package:contacts_app/widgets/base_bottom_sheet.dart';
import 'package:contacts_app/widgets/bottom_sheet.dart';
import 'package:contacts_app/widgets/item_user.dart';
import 'package:contacts_app/widgets/show_avatar.dart';
import 'package:contacts_app/widgets/tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

/// HomeUserList widget
class HomeUserList extends StatelessWidget {
  const HomeUserList({super.key, required this.users, required this.onDeleteUserAction});
  final List<UserModel> users;
  final VoidCallback onDeleteUserAction;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (BuildContext context, int index) {
        final user = users[index];
        return InkWell(
          onTap: () {
            BaseModalBottomSheet.show(
              context: context,
              builder: (context) => BottomSheetWidget(
                bottomSheetContent: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: _buildUserDatas(context, user),
                  ),
                ),
              ),
            );
          },
          child: ItemUserWidget(
            url: user.profileImageUrl!,
            userName: user.firstName!,
            phoneNumber: user.phoneNumber!,
          ),
        );
      },
    );
  }

  Column _buildUserDatas(BuildContext context, UserModel userModel) {
    return Column(
      children: [
        TabBarWidget(
          actionButtonText: 'Edit',
          onCancelPressed: () => Navigator.pop(context),
          onActionPressed: _editUser,
        ),
        Center(
          child: ShowProfilAvatar(
            avatarText: 'Change Photo',
            imageUrl: userModel.profileImageUrl,
            radius: context.border.highRadius.x * 1.5,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(userModel.firstName!),
            const Divider(),
            Text(userModel.lastName!),
            const Divider(),
            Text(userModel.phoneNumber!),
            const Divider(),
            InkWell(
              onTap: () async => onDeleteUserAction.call(),
              child: const Text(
                'Delete contact',
                style: TextStyle(
                  color: ColorName.red,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }


  _editUser() {}
}
