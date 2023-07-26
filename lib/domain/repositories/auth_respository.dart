
import '../datasources/models/auth_result_model.dart';
import '../datasources/models/user_model.dart';

abstract class AuthRepository {
  String? get email;
  UserId? get userId;
  bool get isAlreadyLoggedIn;
  Future<void> logOut();
  Future<AuthResult> loginWithEmailAndPassword(String email, String password);
  Future<AuthResult> registerWithEmailAndPassword(String email, String password);
  Future<AuthResult> loginWithGoogle();
}

