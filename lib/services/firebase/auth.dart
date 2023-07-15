import 'package:firebase_auth/firebase_auth.dart';


class Auth {
  FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> get authState {
    return auth.authStateChanges();
  }
  User? get currentUser {
    return auth.currentUser;
  }

  loginWithEmailAndPassword (String email, password) async{
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password);
        return userCredential;

    } on FirebaseAuthException catch(authException) {
      return authException;

    } catch(e) {
      print(e);
    }

  }

  registerWithEmailAndPassword (String email, String password) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch(e) {
      print(e);

    } catch(e) {
      print(e);
    }
  }

  signOut () async{
    await FirebaseAuth.instance.signOut();
  }
}