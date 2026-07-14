import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 
import 'package:tasky/features/auth/domain/use_cases/sign_up_use_case.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.signUpUseCase) : super(SignUpInitial());

  final SignUpUseCase signUpUseCase;
  
  final TextEditingController nameController=TextEditingController();
  final TextEditingController emailController=TextEditingController();
  final TextEditingController passwordController=TextEditingController();

  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  })async{
    emit(SignUpLoading());
    try {
      await signUpUseCase.signUp(name: name, email: email, password: password);
      emit(SignUpSuccess());
    } on Exception catch (e) {
      emit(SignUpError(errorMessage: e.toString()));
    }
  }
  @override
  Future<void> close() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
