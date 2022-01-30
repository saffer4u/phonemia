import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;

  Stream<User?>? get user {
    return _auth.authStateChanges();
  }
}
