import 'package:bloc/bloc.dart';
import 'package:tasky/features/auth/data/models/login_model.dart';
import 'package:tasky/features/auth/domain/use_cases/login_use_case.dart';
import 'package:tasky/features/auth/presintation/cubit/login/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginUseCase) : super(LoginInitial());

  final LoginUseCase loginUseCase;

  Future<void> login(String email, String password) async {
    emit(LoginLoading());
    try {
      await loginUseCase.login( email, password);

      emit(LoginSuccess());
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}
