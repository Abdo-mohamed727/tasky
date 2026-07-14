import 'package:get_it/get_it.dart';
import 'package:tasky/core/services/auth_services.dart';
import 'package:tasky/features/auth/data/auth_data_source/auth_data_source.dart';
import 'package:tasky/features/auth/data/repo/login_repo_imp.dart';
import 'package:tasky/features/auth/domain/auth_repo/auth_repo.dart';
import 'package:tasky/features/auth/domain/use_cases/login_use_case.dart';
import 'package:tasky/features/auth/domain/use_cases/sign_up_use_case.dart';
import 'package:tasky/features/auth/presintation/cubit/login/login_cubit.dart';
import 'package:tasky/features/auth/presintation/cubit/sign_up/cubit/sign_up_cubit.dart';

final sl = GetIt.instance;

Future<void> setup() async {
  await _initCore();
  await _initAuth();
}

Future<void> _initCore() async {
  sl.registerLazySingleton<AuthServices>(() => AuthServicesImp());
}

Future<void> _initAuth() async {
  sl.registerLazySingleton<AuthDataSource>(
    () => AuthDataSourceImp(authServices: sl()),
  );
  sl.registerLazySingleton<LoginRepo>(() => LoginRepoImp(sl()));
  sl.registerLazySingleton<LoginUseCase>(() => LoginUseCase(sl()));
  sl.registerFactory<LoginCubit>(() => LoginCubit(sl()));
  sl.registerLazySingleton<SignUpRepo>(() => SignUpRepoImp(sl()));
  sl.registerLazySingleton<SignUpUseCase>(() => SignUpUseCase(sl()));
  sl.registerFactory<SignUpCubit>(() => SignUpCubit(sl()));
}
