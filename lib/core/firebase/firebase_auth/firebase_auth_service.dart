
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  static final FirebaseAuthService _instance = FirebaseAuthService._internal();

  final FirebaseAuth firebaseAuth;

  factory FirebaseAuthService() {
    return _instance;
  }

  FirebaseAuthService._internal() : firebaseAuth = FirebaseAuth.instance;
}
