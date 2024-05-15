import 'package:contacts_app/core/component/base_text_field.dart';
import 'package:contacts_app/model/user_model.dart';
import 'package:contacts_app/product/state/base_state.dart';
import 'package:contacts_app/screens/home/view/mixin/home_view_mixin.dart';
import 'package:contacts_app/screens/home/view/widget/home_user_list.dart';
import 'package:contacts_app/screens/home/view_model/home_view_model.dart';
import 'package:contacts_app/screens/home/view_model/state/home_state.dart';
import 'package:contacts_app/util/assets_constant.dart';
import 'package:contacts_app/widgets/app_bar.dart';
import 'package:contacts_app/widgets/base_bottom_sheet.dart';
import 'package:contacts_app/widgets/bottom_sheet.dart';
import 'package:contacts_app/widgets/no_contacts.dart';
import 'package:contacts_app/widgets/search_bar.dart';
import 'package:contacts_app/widgets/show_avatar.dart';
import 'package:contacts_app/widgets/show_snackBar.dart';
import 'package:contacts_app/widgets/tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

/// Home Screen
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends BaseState<HomeView> with HomeViewMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeViewModel,
      child: Scaffold(
        appBar: AppBarWidget(
          appTitle: 'Contacts',
          onAddButtonPressed: () => BaseModalBottomSheet.show(
            context: context,
            builder: (context) => BottomSheetWidget(
              bottomSheetContent: Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: _buildForm(context),
                ),
              ),
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SearchBarWidget(),
            Expanded(
              child: _UserBlocList(),
            ),
          ],
        ),
      ),
    );
  }

  Form _buildForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TabBarWidget(
            title: 'New Contact',
            actionButtonText: 'Done',
            onCancelPressed: _onClickCancel,
            onActionPressed: () async {
              if (_formKey.currentState!.validate()) {
                final success = await homeViewModel.addUser(
                  firstNameController.text,
                  lastNameController.text,
                  phoneNumberController.text,
                  null,
                );

                if (success != null) {
                  if (success) {
                    _onClickCancel();
                    _showSuccesSnackBar('User Added!', context);
                  }
                }
              }
            },
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
    );
  }

  void _showSuccesSnackBar(String messages, BuildContext context) {
    ShowBaseSnackBar.show(
      context: context,
      message: messages,
      textColor: Colors.green,
      image: Assets.svg.badgeCheck.svg(
        width: context.sized.normalValue,
      ),
      duration: 3,
    );
  }

  void _onClickCancel() => Navigator.of(context).pop();
}

class _UserBlocList extends StatelessWidget {
  const _UserBlocList();

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeViewModel, HomeState>(
      listener: (context, state) {},
      child: BlocSelector<HomeViewModel, HomeState, List<UserModel>>(
        selector: (state) {
          return state.users ?? [];
        },
        builder: (context, state) {
          if (state.isEmpty) return const NoContactsWidget();

          return HomeUserList(
            users: state,
            onDeleteUserAction: () => state,
          );
        },
      ),
    );
  }
}
