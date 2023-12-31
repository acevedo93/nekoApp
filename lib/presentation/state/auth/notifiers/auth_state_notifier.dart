import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nekonapp/domain/datasources/models/user_model.dart';
import 'package:nekonapp/infrastructure/datasources/firebase/firebase_auth_datasource_impl.dart';
import 'package:nekonapp/infrastructure/datasources/firebase/firebase_user_datasource_impl.dart';
import 'package:nekonapp/infrastructure/repositories/auth_repository_impl.dart';
import 'package:nekonapp/infrastructure/repositories/user_repository_impl.dart';
import '../../../../domain/datasources/models/auth_result_model.dart';
import '../auth_state.dart';

class AuthStateNotifier extends StateNotifier<AuthState> {
  final _authRepository =
      AuthRepositoryImpl(authDataSource: FirebaseAuthDataSourceImpl());
  final _userRepository = UserRepositoryImpl(datasource: FirebaseUserDataSourceImpl());
      

  AuthStateNotifier() : super(AuthState.unknown()) {
    if (_authRepository.isAlreadyLoggedIn) {
      state = AuthState(
          result: AuthResult(status: AuthResultStatus.success),
          isLoading: false,
          userId: _authRepository.userId);
    }
  }

  Future<void> logOut() async {
    state = state.copiedWithIsLoading(true);
    await _authRepository.logOut();
    state = AuthState.unknown();
  }

  Future<void> registerWithEmailAndPassword(
      String email, String password, String name) async {
    state = state.copiedWithIsLoading(true);
    final result =
        await _authRepository.registerWithEmailAndPassword(email, password);
    final userId = _authRepository.userId;
    if (userId != null && result.status == AuthResultStatus.success) {
      await saveUser(email, DateTime.now().toString(), 'M', userId, name);
    }
    state = state.copyWith(userId, false, result); 
  }

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    state = state.copiedWithIsLoading(true);
    final result =
        await _authRepository.loginWithEmailAndPassword(email, password);
    final userId = _authRepository.userId;
    state = state.copyWith(userId, false, result); 
  }

  Future<void> saveUser(String email, String createdAt, String genre,
      String userId, String name) async {
    final UserModel data = UserModel(
        id: userId,
        name: name,
        email: email,
        genre: genre,
        createdAt: createdAt);
    await _userRepository.saveUser(data);
  }
}
