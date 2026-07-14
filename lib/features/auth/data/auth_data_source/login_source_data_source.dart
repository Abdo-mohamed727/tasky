import 'package:tasky/core/services/auth_services.dart';
import 'package:tasky/features/auth/data/models/login_model.dart';

abstract class LoginDataSource {
  Future<void> login(LoginModel loginModel);
}

class LoginDataSourceImp implements LoginDataSource {
  final AuthServices   authServices;

  LoginDataSourceImp({required this.authServices});

  @override
  Future<void> login(LoginModel loginModel) async {
    await authServices.login(loginModel.email, loginModel.password);
  }
}
