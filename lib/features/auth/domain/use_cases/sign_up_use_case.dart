import 'package:tasky/features/auth/domain/auth_repo/auth_repo.dart';

class SignUpUseCase {
  final SignUpRepo signUpRepo;

  SignUpUseCase(this.signUpRepo);

  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) {
    return signUpRepo.signUp(
      name: name,
      email: email,
      password: password,
    );
  }
}