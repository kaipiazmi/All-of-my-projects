import 'package:firebase_auth/firebase_auth.dart';

class AuthManager {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<User?> getCurrentUser() async {
    return _firebaseAuth.currentUser;
  }

  bool isLoggedIn(User? user) {
    return user != null;
  }
}
