import 'package:bloc/bloc.dart';
import 'package:flutter_educatly_task/features/auth/manager/register/register_cubit.dart';
import 'package:flutter_educatly_task/features/chats/manager/send_message/send_message_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/manager/login/login_cubit.dart';
import '../../features/chats/manager/get_messages/get_messages_cubit.dart';
import '../../features/chats/manager/typing/typing_cubit.dart';
import '../../features/home/manager/all_users/all_users_cubit.dart';
import '../../features/home/manager/update_user_status/update_user_status_cubit.dart';
import '../global_cubit/bloc_observer.dart';
import '../global_cubit/global/global_cubit.dart';
import '../network/network_service/network_provider.dart';
import '../network/network_service/network_service.dart';
import '../network/network_service/network_service_impl.dart';
import '../repository/global/global_repository.dart';
import '../repository/global/global_repository_impl.dart';
import '../shared_preferences/preference_helper.dart';
import '../shared_preferences/preferences_provider.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Core
  Bloc.observer = MyBlocObserver();

// Bloc

  sl.registerFactory(
    () => GlobalCubit(
      globalRepository: sl(),
    ),
  );

  sl.registerFactory(
    () => LoginCubit(),
  );


  sl.registerFactory(
    () => RegisterCubit(),
  );
  sl.registerFactory(
    () => UpdateUserStatusCubit(),
  );
  sl.registerFactory(
    () => AllUsersCubit(),
  );
  sl.registerFactory(
    () => GetMessagesCubit(),
  );
  sl.registerFactory(
    () => SendMessageCubit(),
  );
  sl.registerFactory(
    () => TypingCubit(),
  );

  // sl.registerFactory(
  //   () => RegisterCubit(
  //     registerUseCase: sl(),
  //   ),
  // );
// Usecases

  // sl.registerLazySingleton<GetProfileUseCase>(() => GetProfileUseCase(sl()));
  // sl.registerLazySingleton<LoginUsecase>(() => LoginUsecase(sl()));
  // sl.registerLazySingleton<LogoutUsecase>(() => LogoutUsecase(sl()));
  // sl.registerLazySingleton<UpdatePushTokenUseCase>(() => UpdatePushTokenUseCase(sl()));
  // sl.registerLazySingleton<RegisterUseCase>(() => RegisterUseCase(sl()));
  // sl.registerLazySingleton<ForgetPasswordUseCase>(() => ForgetPasswordUseCase(sl()));
  // sl.registerLazySingleton<OtpUseCase>(() => OtpUseCase(sl()));
  // sl.registerLazySingleton<NewPasswordUseCase>(() => NewPasswordUseCase(sl()));

// Repository

  // sl.registerLazySingleton<AuthRepository>(
  //   () => AuthRepositoryImpl(
  //     networkService: sl(),
  //     authDataSource: sl(),
  //   ),
  // );

  sl.registerLazySingleton<GlobalRepository>(
    () => GlobalRepositoryImpl(
      helper: sl(),
    ),
  );

// Datasources

//   sl.registerFactory<AuthDataSource>(
//       () => AuthDataSourceImpl(dioService: sl()));
//
// //! External
//   sl.registerLazySingleton<DioService>(
//     () => DioServiceImpl(
//       dioProvider: sl(),
//     ),
//   );
//   sl.registerLazySingleton<DioProvider>(
//     () => DioProvider.instance,
//   );
  sl.registerLazySingleton<NetworkService>(
    () => NetworkServiceImpl(
      networkProvider: sl(),
    ),
  );
  sl.registerLazySingleton<NetworkProvider>(
    () => NetworkProvider.instance,
  );
  sl.registerLazySingleton(
    () => SharedPreferencesProvider.instance,
  );
  sl.registerLazySingleton<PreferenceHelper>(
    () => PreferenceHelper(
      preferencesProvider: sl(),
    ),
  );
}
