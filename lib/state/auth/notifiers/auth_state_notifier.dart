import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nekonapp/domain/datasources/models/user_model.dart';
import 'package:nekonapp/infrastructure/datasources/firebase/firebase_auth_datasource_impl.dart';
import 'package:nekonapp/infrastructure/repositories/auth_repository_impl.dart';
import 'package:nekonapp/state/auth/models/auth_result.dart';
import 'package:nekonapp/state/user/notifiers/user_state_notifier.dart';
import '../auth_state.dart';

class AuthStateNotifier extends StateNotifier<AuthState> {
  final _authRepository =
      AuthRepositoryImpl(authDataSource: FirebaseAuthDataSourceImpl());
      final _userState = UserStateNotifier();

  AuthStateNotifier() : super(const AuthState.unknown()) {
    if (_authRepository.isAlreadyLoggedIn) {
      state = AuthState(
          result: AuthResult.success,
          isLoading: false,
          userId: _authRepository.userId);
    }
  }

  Future<void> logOut() async {
    state = state.copiedWithIsLoading(true);
    await _authRepository.logOut();
    state = const AuthState.unknown();
  }

  Future<void> registerWithEmailAndPassword(
      String email, String password) async {
    state = state.copiedWithIsLoading(true);
    final result = await _authRepository.registerWithEmailAndPassword(email, password);
    final userId = _authRepository.userId;
      state = state.copyWith(userId, false, result);
  }

  Future<void> loginWithEmailAndPassword(String email, String password, UserModel data) async{
    state = state.copiedWithIsLoading(true);
    final result =  await _authRepository.loginWithEmailAndPassword(email, password);
    final userId = _authRepository.userId;
    state = state.copyWith(userId, false, result);
    if(userId!= null && result != AuthResult.failure){
    await _userState.saveUser(UserModel(id: userId, name: name, email: email, genre: genre, createdAt: createdAt))
    }
  


  }
}
