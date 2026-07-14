import 'package:tasky/features/auth/domain/auth_repo/login_repo.dart';

class LoginUseCase {
  final LoginRepo loginRepo;

  LoginUseCase(this.loginRepo);

  Future<void> login( String email,String password) {
    return loginRepo.login(email,password);
  }
}
