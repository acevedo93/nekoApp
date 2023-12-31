

import 'package:nekonapp/domain/datasources/auth_datasource.dart';
import 'package:nekonapp/domain/repositories/auth_respository.dart';

import '../../domain/datasources/models/auth_result_model.dart';
import '../../domain/datasources/models/user_model.dart';


class AuthRepositoryImpl extends AuthRepository {

  final AuthDatasource authDataSource;

  AuthRepositoryImpl({
    required this.authDataSource
  });

  @override
  String? get email => authDataSource.email;

  @override
  bool get isAlreadyLoggedIn => authDataSource.isAlreadyLoggedIn;

  @override
  Future<void> logOut() {
    return authDataSource.logOut();
  }

  @override
  Future<AuthResult> loginWithEmailAndPassword(String email, String password) {
    return authDataSource.loginWithEmailAndPassword(email, password);
  }

  @override
  Future<AuthResult> loginWithGoogle() {
    return authDataSource.loginWithGoogle();
  }

  @override
  UserId? get userId => authDataSource.userId;
  
  @override
  Future<AuthResult> registerWithEmailAndPassword(String email, String password) {
    return authDataSource.registerWithEmailAndPassword(email, password);
  }
  
}