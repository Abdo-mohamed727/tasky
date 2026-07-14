abstract class LoginRepo {
  Future<void> login(String email, String password);
}

abstract class SignUpRepo {
  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  });
}
