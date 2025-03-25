part of 'update_user_status_cubit.dart';

@immutable
sealed class UpdateUserStatusState {}

final class UpdateUserStatusInitial extends UpdateUserStatusState {}
final class UpdateUserStatusSuccessState extends UpdateUserStatusState {}
final class UpdateUserStatusErrorState extends UpdateUserStatusState {}
