


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nekonapp/domain/datasources/models/user_model.dart';
import 'package:nekonapp/infrastructure/datasources/firebase/firebase_user_datasource_impl.dart';
import 'package:nekonapp/infrastructure/repositories/user_repository_impl.dart';
import 'package:nekonapp/state/auth/models/user_id.dart';

import '../user_state.dart';

class UserStateNotifier extends StateNotifier<UserState> {
  final _userRepository = UserRepositoryImpl(datasource: FirebaseUserDataSourceImpl() );

  UserStateNotifier(): super(const UserState(isLoading: false, currentUser: null));

  Future<void> getUserById(UserId id) async {
    state = state.copiedWithIsLoading(true);
    final currentUser = await _userRepository.getUserById(id);
    state = state.copyWith(false, currentUser);
  }

  Future<void> saveUser(UserModel user) async{
    state = state.copiedWithIsLoading(true);
    await _userRepository.saveUser(user); 
    state = state.copyWith(false, user);
  }
  Future<void> updateUser(UserModel user) async {
    state = state.copiedWithIsLoading(true);
    await _userRepository.updateUser(user);
    state = state.copyWith(false, user);
  } 
}