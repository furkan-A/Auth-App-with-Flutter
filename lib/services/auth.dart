import 'package:firebase_auth/firebase_auth.dart';
// import '../models/user.dart';
// import 'package:flutter_dev_challenge/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // User _userFromFirebaseUser(UserCredential user) {
  //   return user != null ? User(uid: user.uid) : null;
  // }

  // sign up with email & password // register

  Future signUp(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      User? user = result.user;
      return user; //_userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // login with email & password

  Future<User?> signIn(String email, String password) async {
    try {
      var user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return user.user;
    } on Exception catch (e) {
      print('Bulunan Exception: ' + e.toString());
      return null;
    }
  }

  //  sign out

  Future signOut() async {
    return await _auth.signOut();
  }
}
