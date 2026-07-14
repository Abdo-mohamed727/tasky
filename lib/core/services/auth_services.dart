import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthServices {
  Future<void> login(String email, String password);
}

class AuthServicesImp implements AuthServices {
  final firebaseAuth = FirebaseAuth.instance;
  @override
  Future<void> login(String email, String password) async {
    try {
      final credential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = credential.user;
      if (user != null) {
        return;
      } else {
        throw Exception("User not found");
      }
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }
}
