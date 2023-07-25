import 'package:nekonapp/state/auth/models/auth_result.dart';

import '../../state/auth/models/user_id.dart';

abstract class AuthRepository {
  String? get email;
  UserId? get userId;
  bool get isAlreadyLoggedIn;
  Future<void> logOut();
  Future<AuthResult> loginWithEmailAndPassword(String email, String password);
  Future<AuthResult> registerWithEmailAndPassword(String email, String password);
  Future<AuthResult> loginWithGoogle();
}

