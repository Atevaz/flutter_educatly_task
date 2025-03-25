import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthProvider {
  static final _instance = FirebaseAuthProvider._internal();
  bool isInitialized = false;

  static FirebaseAuthProvider get instance => _instance;

  late FirebaseAuth _firebaseAuth;

  FirebaseAuthProvider._internal();

  Future<FirebaseAuth> get() async {
    if (!isInitialized) await init();
    return _firebaseAuth;
  }

  Future<void> init() async {
    _firebaseAuth = FirebaseAuth.instance;
    isInitialized = true;
  }
}
