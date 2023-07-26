


import 'models/auth_result_model.dart';
import 'models/user_model.dart';

abstract class AuthDatasource {
  String? get email;
  UserId? get userId;
  bool get isAlreadyLoggedIn;
  Future<void> logOut();
  Future<AuthResult> loginWithEmailAndPassword(String email, String password);
  Future<AuthResult> loginWithGoogle();
  Future<AuthResult> registerWithEmailAndPassword(String email, String password);
}
