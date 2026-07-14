import 'package:tasky/core/services/auth_services.dart';
import 'package:tasky/features/auth/data/models/login_model.dart';
import 'package:tasky/features/auth/data/models/sign_up_model.dart';

abstract class AuthDataSource {
  Future<void> login(LoginModel loginModel);
  Future<void> signUp(SignUpModel signUpModel);
}

class AuthDataSourceImp implements AuthDataSource {
  final AuthServices authServices;

  AuthDataSourceImp({required this.authServices});

  @override
  Future<void> login(LoginModel loginModel) async {
    await authServices.login(loginModel.email, loginModel.password);
  }

  @override
  Future<void> signUp(SignUpModel signUpModel) async {
    await authServices.signUp(
      name: signUpModel.name,
      email: signUpModel.email,
      password: signUpModel.password,
    );
  }
}
