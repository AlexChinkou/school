import 'package:firebase_auth/firebase_auth.dart';

class Authentification {
  final FirebaseAuth firebaseAuth;

  Authentification(this.firebaseAuth);

  Stream<User> get authStateChanges => firebaseAuth.authStateChanges();

  Future<String> logIn({String email, String password}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return "login";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String> signIn({String email, String password}) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "sign Up";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}
