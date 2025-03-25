part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class AuthInitial extends LoginState {}
final class LoginLoadingState extends LoginState {}
final class LoginSuccessState extends LoginState {}
final class LoginErrorState extends LoginState {}

final class LoginChangePasswordVisibilityState extends LoginState {}
