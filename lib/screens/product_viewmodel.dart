// ignore_for_file: public_member_api_docs

import 'package:contacts_app/screens/home/view_model/state/base_cubit.dart';
import 'package:contacts_app/screens/product_state.dart';
import 'package:flutter/material.dart';

class ProductViewModel extends BaseCubit<ProductState> {
  ProductViewModel() : super(const ProductState());

  /// Change theme mode
  /// [themeMode] is [ThemeMode.light] or [ThemeMode.dark]
  void changeThemeMode(ThemeMode themeMode) {
    emit(state.copyWith(themeMode: themeMode));
  }
}
