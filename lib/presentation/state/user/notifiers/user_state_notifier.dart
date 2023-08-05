
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nekonapp/domain/datasources/models/user_model.dart';
import 'package:nekonapp/infrastructure/datasources/firebase/firebase_user_datasource_impl.dart';
import 'package:nekonapp/infrastructure/repositories/user_repository_impl.dart';
import '../../../../infrastructure/datasources/firebase/firebase_auth_datasource_impl.dart';
import '../../../../infrastructure/repositories/auth_repository_impl.dart';
import '../user_state.dart';

class UserStateNotifier extends StateNotifier<UserState> {
  final _userRepository = UserRepositoryImpl(datasource: FirebaseUserDataSourceImpl() );
  final _authRepository = AuthRepositoryImpl(authDataSource: FirebaseAuthDataSourceImpl());

  UserStateNotifier(): super(const UserState(isLoading: false, currentUser: null, settings: null)) {
    if(_authRepository.isAlreadyLoggedIn){
      getSettings();
    }

  }

  Future<void> get user async {
    final userId =_authRepository.userId;
    state = state.copiedWithIsLoading(true);
    final currentUser = await _userRepository.getUserById(userId!);
    state = state.copyWith( isLoading: false, currentUser: currentUser);
  }

  Future<void> saveUser(UserModel user) async{
    state = state.copiedWithIsLoading(true);
    await _userRepository.saveUser(user); 
    state = state.copyWith(isLoading: false, currentUser: user);
  }
  Future<void> updateUser(UserModel user) async {
    state = state.copiedWithIsLoading(true);
    await _userRepository.updateUser(user);
    state = state.copyWith(isLoading: false, currentUser: user);
  } 
  Future<void> getSettings() async {
    state = state.copiedWithIsLoading(true);
    final userId = _authRepository.userId;
    final settings = await _userRepository.getSettingsById(userId!);
    state = state.copyWith(isLoading: false, settings: settings);

  }
}