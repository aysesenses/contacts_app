// ignore_for_file: public_member_api_docs

import 'package:contacts_app/model/user_model.dart';
import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  const HomeState({required this.isLoading, this.users});

  final bool isLoading;
  final List<UserModel>? users;

  @override
  List<Object?> get props => [isLoading, users];

  HomeState copyWith({bool? isLoading, List<UserModel>? users}) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      users: users ?? this.users,
    );
  }
}
