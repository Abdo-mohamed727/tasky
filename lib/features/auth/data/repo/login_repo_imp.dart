import 'package:tasky/features/auth/data/auth_data_source/login_source_data_source.dart';
import 'package:tasky/features/auth/data/models/login_model.dart';
import 'package:tasky/features/auth/domain/auth_repo/login_repo.dart';

class LoginRepoImp implements LoginRepo {
  final LoginDataSource loginDataSource;

  LoginRepoImp(this.loginDataSource);

  @override
  Future<void> login(email, password) {
    return loginDataSource.login(LoginModel(email: email, password: password));
  }
}
