import 'package:contacts_app/widgets/tab_bar.dart';
import 'package:flutter/material.dart';

class AddUserScreen extends StatefulWidget {
  const AddUserScreen({super.key});

  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF4F4F4),
        body: Column(
          children: const [
          //  TabBarWidget(),
          ],
        ),
      ),
    );
  }
}
