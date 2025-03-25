part of 'all_users_cubit.dart';

@immutable
sealed class AllUsersState {}

final class AllUsersInitial extends AllUsersState {}
final class GetAllUsersLoadingState extends AllUsersState {}
final class GetAllUsersSuccessState extends AllUsersState {}
final class ChangeSelectedUserModelState extends AllUsersState {}

