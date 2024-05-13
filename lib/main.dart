// ignore_for_file: public_member_api_docs

import 'package:contacts_app/product/init/application_initialize.dart';
import 'package:contacts_app/product/theme/custom_light_theme.dart';
import 'package:contacts_app/util/extensions.dart';
import 'package:contacts_app/widgets/app_bar.dart';
import 'package:contacts_app/widgets/bottom_sheet.dart';
import 'package:contacts_app/widgets/choose_profil_photo.dart';
import 'package:contacts_app/widgets/form_widget.dart';
import 'package:contacts_app/widgets/no_contacts.dart';
import 'package:contacts_app/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Future<void> main() async {
  await ApplicationInitialize().make();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: CustomLightTheme().themeData,
      home: const MyHomePage(title: 'Contacts'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBarWidget(
        appTitle: widget.title,
        onAddButtonPressed: () => _showModalBottomSheetScreen(context),
      ),
      body: Column(
        children: const <Widget>[
          SearchBarWidget(),
          Expanded(
            child: NoContactsWidget(),
          ),
        ],
      ),
    );
  }

  _showSnack() {
    context.showSnackbar(
      'user added',
      Colors.green,
      SvgPicture.asset('assets/svg/badge_check.svg'),
    );
  }

  Future<void> _showModalBottomSheetScreen(BuildContext context) async {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => BottomSheetWidget(
        isSmallBottomSheet: false,
        onCancelPressed: onClickCancel,
        onDonePressed: onClickDone,
        bottomSheetContent: const UserAddForm(),
      ),
      enableDrag: false,
      isDismissible: false,
      isScrollControlled: true,
    );
  }

  ChoseProfilPhoto _chooseProfil() {
    return ChoseProfilPhoto(
      cameraPressed: onClickCancel,
      galleryPressed: onClickCancel,
      cancelPressed: onClickCancel,
    );
  }

  void onClickCancel() => Navigator.of(context).pop();
  void onClickDone() => Navigator.of(context).pop();
}
