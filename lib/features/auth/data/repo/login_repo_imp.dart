import 'package:tasky/features/auth/data/auth_data_source/auth_data_source.dart';
import 'package:tasky/features/auth/data/models/login_model.dart';
import 'package:tasky/features/auth/data/models/sign_up_model.dart';
import 'package:tasky/features/auth/domain/auth_repo/auth_repo.dart';

class LoginRepoImp implements LoginRepo {
  final AuthDataSource authDataSource;

  LoginRepoImp(this.authDataSource);

  @override
  Future<void> login(email, password) {
    return authDataSource.login(LoginModel(email: email, password: password));
  }
}

class SignUpRepoImp implements SignUpRepo {
  final AuthDataSource authDataSource;

  SignUpRepoImp(this.authDataSource);

  @override
  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) {
    return authDataSource.signUp(
      SignUpModel(name: name, email: email, password: password),
    );
  }
}
