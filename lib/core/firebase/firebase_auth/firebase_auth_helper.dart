
import 'package:flutter_educatly_task/core/firebase/firebase_auth/forebase_auth_provider.dart';

class FirebaseAuthHelper {
  final FirebaseAuthProvider firebaseAuthProvider;

  FirebaseAuthHelper({required this.firebaseAuthProvider});

  Future<void> init() async => await firebaseAuthProvider.init();
}