// ignore_for_file: public_member_api_docs

import 'package:contacts_app/product/state/base_state.dart';
import 'package:contacts_app/product/state/product_state_items.dart';
import 'package:contacts_app/screens/home/view/home_view.dart';
import 'package:contacts_app/screens/home/view_model/home_view_model.dart';
import 'package:contacts_app/service/product_network_error_manager.dart';
import 'package:contacts_app/service/repository/user_service.dart';

/// Manage your home view business logic
mixin HomeViewMixin on BaseState<HomeView> {
  late final ProductNetworkErrorManager _productNetworkErrorManager;

  late final HomeViewModel _homeViewModel;

  HomeViewModel get homeViewModel => _homeViewModel;

  @override
  void initState() {
    super.initState();

    _productNetworkErrorManager = ProductNetworkErrorManager(context);
    ProductStateItems.productNetworkManager.listenErrorState(
      onErrorStatus: _productNetworkErrorManager.handleError,
    );

    _homeViewModel = HomeViewModel(
      userService: UserService(
        productNetworkManager,
      ),
    );

    _homeViewModel.fetchUsers();
  }
}
