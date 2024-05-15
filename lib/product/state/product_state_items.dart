// ignore_for_file: public_member_api_docs

import 'package:contacts_app/product/state/product_state_container.dart';
import 'package:contacts_app/screens/product_viewmodel.dart';
import 'package:contacts_app/service/manager/api_service_manager.dart';

class ProductStateItems {
  const ProductStateItems._();

  static ProductNetworkManager get productNetworkManager =>
      ProductContainer.read<ProductNetworkManager>();
  static ProductViewModel get productViewModel => ProductContainer.read<ProductViewModel>();
}
