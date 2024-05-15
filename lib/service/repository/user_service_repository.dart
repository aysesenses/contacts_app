// ignore_for_file: public_member_api_docs

import 'package:contacts_app/model/user_model.dart';

abstract class UserServiceRepository {
  Future<List<UserModel>?> getUsers();
  Future<bool?> addUser(
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? profileImageUrl,
  );
  Future<bool?> deleteUser(String userId);
}
