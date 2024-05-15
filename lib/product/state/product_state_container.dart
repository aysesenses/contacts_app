import 'package:contacts_app/screens/product_viewmodel.dart';
import 'package:contacts_app/service/manager/api_service_manager.dart';
import 'package:get_it/get_it.dart';

/// Product container for dependency injection
class ProductContainer {
  const ProductContainer._();
  static final _getIt = GetIt.I;

  /// Product core required items
  static void setup() {
    _getIt
      ..registerSingleton(ProductNetworkManager.base())
      ..registerSingleton(ProductViewModel());
  }

  static T read<T extends Object>() => _getIt<T>();
}
