// ignore_for_file: public_member_api_docs

import 'package:contacts_app/product/state/product_state_items.dart';
import 'package:contacts_app/screens/home/view_model/home_view_model.dart';
import 'package:contacts_app/screens/product_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StateInitialize extends StatelessWidget {
  const StateInitialize({
    required this.child,
    super.key,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductViewModel>.value(
          value: ProductStateItems.productViewModel,
        )
      ],
      child: child,
    );
  }
}
