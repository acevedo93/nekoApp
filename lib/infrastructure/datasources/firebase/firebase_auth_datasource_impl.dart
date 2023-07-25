

import 'package:firebase_auth/firebase_auth.dart';
import 'package:nekonapp/domain/datasources/auth_datasource.dart';
import 'package:nekonapp/state/auth/models/auth_result.dart';
import '../../../state/auth/models/user_id.dart';

class FirebaseAuthDataSourceImpl extends AuthDatasource {

  @override
  UserId? get userId => FirebaseAuth.instance.currentUser?.uid;

  @override
  String? get email => FirebaseAuth.instance.currentUser?.email;
  @override 
  bool get isAlreadyLoggedIn => userId != null;

  @override
  Future<void> logOut() async{
    return FirebaseAuth.instance.signOut();
  }

  @override
  Future<AuthResult> loginWithEmailAndPassword(String email, String password) async{
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      return AuthResult.success;

    } on FirebaseAuthException catch(err) {
      return AuthResult.failure;
    }
    
  }

  @override
  Future<AuthResult> loginWithGoogle() {
    throw UnimplementedError();
  }
  
  @override

  Future<AuthResult> registerWithEmailAndPassword(String email, String password) async{
    try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    return AuthResult.success;
    } on FirebaseAuthException catch(err) {
      return AuthResult.failure;
    }

  }


}