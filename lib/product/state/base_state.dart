// ignore_for_file: public_member_api_docs

import 'package:contacts_app/product/state/product_state_items.dart';
import 'package:contacts_app/service/api_service_manager.dart';
import 'package:flutter/material.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  ProductNetworkManager get productNetworkManager => ProductStateItems.productNetworkManager;

  
//  ProductViewModel get productViewModel => ProductStateItems.productViewModel;

}
