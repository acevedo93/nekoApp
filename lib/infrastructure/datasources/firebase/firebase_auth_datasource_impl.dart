import 'package:firebase_auth/firebase_auth.dart';
import 'package:nekonapp/domain/datasources/auth_datasource.dart';
import 'package:nekonapp/infrastructure/datasources/firebase/firebase_error_adapter.dart';
import '../../../domain/datasources/models/auth_result_model.dart';
import '../../../domain/datasources/models/user_model.dart';

class FirebaseAuthDataSourceImpl extends AuthDatasource {
  @override
  UserId? get userId => FirebaseAuth.instance.currentUser?.uid;

  @override
  String? get email => FirebaseAuth.instance.currentUser?.email;
  @override
  bool get isAlreadyLoggedIn => userId != null;

  @override
  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Future<AuthResult> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return AuthResult(status: AuthResultStatus.success);
    } on FirebaseAuthException catch (err) {
      final message = FirebaseErrorAdapter.getErrorMessage(err);
      return AuthResult(status: AuthResultStatus.failure, message: message);
    }
  }

  @override
  Future<AuthResult> loginWithGoogle() {
    throw UnimplementedError();
  }

  @override
  Future<AuthResult> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return AuthResult(status: AuthResultStatus.success);
    } on FirebaseAuthException catch (err) {
      final message = FirebaseErrorAdapter.getErrorMessage(err);
      return AuthResult(status: AuthResultStatus.failure, message: message);
    }
  }
}
