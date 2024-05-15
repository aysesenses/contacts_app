// ignore_for_file: public_member_api_docs

import 'package:contacts_app/product/init/application_initialize.dart';
import 'package:contacts_app/product/init/state_initialize.dart';
import 'package:contacts_app/product/theme/custom_light_theme.dart';
import 'package:contacts_app/screens/home/view/home_view.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await ApplicationInitialize().make();
  runApp(const StateInitialize(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomLightTheme().themeData,
      home: const HomeView(),
    );
  }
}
