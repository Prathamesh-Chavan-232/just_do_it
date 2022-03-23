import 'package:firebase_auth/firebase_auth.dart';
import '/models/user.dart';

class AuthService {
  // Todo:

  // Sign-in Anonymously
  // Sign-in email & password
  // Register with email & password

  final FirebaseAuth _auth = FirebaseAuth.instance;
  dynamic _createUser(User? user) {
    return user != null ? MyUser(userId: user.uid) : null;
  }

  AuthService();

  // Auth change user stream
  Stream<MyUser?> get userStream {
    return _auth.authStateChanges().map((User? user) => _createUser(user));
  }

  Future signup(String email, String password) async {
    try {
      UserCredential res = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = res.user!;
      return _createUser(user);
    } catch (exp) {
      print(exp.toString());
      return null;
    }
  }

  Future signIn(String email, String password) async {
    try {
      UserCredential res = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = res.user!;
      return _createUser(user);
    } catch (exp) {
      print(exp.toString());
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (exp) {
      print(exp.toString());
      return null;
    }
  }

  Future signInAnon() async {
    try {
      UserCredential res = await _auth.signInAnonymously();
      User user = res.user!;
      return _createUser(user);
    } catch (exp) {
      print(exp.toString());
      return null;
    }
  }
}
