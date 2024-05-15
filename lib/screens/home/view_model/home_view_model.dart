// ignore_for_file: public_member_api_docs

import 'package:contacts_app/model/user_model.dart';
import 'package:contacts_app/screens/home/view_model/state/base_cubit.dart';
import 'package:contacts_app/screens/home/view_model/state/home_state.dart';
import 'package:contacts_app/service/repository/user_service.dart';
import 'package:contacts_app/service/repository/user_service_repository.dart';

/// Manage your home view business logic
class HomeViewModel extends BaseCubit<HomeState> {
  /// [UserServiceRepository] service
  HomeViewModel({
    required UserService userService,
  })  : _userServiceRepository = userService,
        super(const HomeState(isLoading: false));

  final UserServiceRepository _userServiceRepository;

  List<UserModel>? userlist;

  /// Get users
  Future<void> fetchUsers() async {
    final response = await _userServiceRepository.getUsers();
    emit(state.copyWith(users: response));
  }

  /// Add user
  Future<bool?> addUser(
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? profileImageUrl,
  ) async {
    final response = await _userServiceRepository.addUser(
      firstName,
      lastName,
      phoneNumber,
      profileImageUrl,
    );
    return response;
  }

  /// Delete user
  Future<bool?> deleteUser(String userId) async {
    final response = await _userServiceRepository.deleteUser(userId);
    return response;
  }
}
