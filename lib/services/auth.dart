import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthBase {
  User? get currentUser;

  Stream<User?> authStateChange();
  // برحع حالت authintaction
  //streaem is return real time data
  Future<User?> loginWithEmailAndPassword(
      {required String email, required String password});

  Future<User?> signUpWithEmailAndPassword(
      {required String email, required String password});
}

class Auth implements AuthBase {
  final _fireBaseAuth = FirebaseAuth.instance;

  @override
  Future<User?> loginWithEmailAndPassword(
      {required String email, required String password}) async {
    final userAuth = await _fireBaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return userAuth.user;
  }

  @override
  Future<User?> signUpWithEmailAndPassword(
      {required String email, required String password}) async {
    final userAuth = await _fireBaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return userAuth.user;
  }

  @override
  Stream<User?> authStateChange() {
    _fireBaseAuth.authStateChanges();
    throw UnimplementedError();
  }

  @override
  // TODO: implement currentUser
  User? get currentUser => _fireBaseAuth.currentUser;
}
