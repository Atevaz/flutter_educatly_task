part of 'get_messages_cubit.dart';

@immutable
sealed class GetMessagesState {}

final class GetMessagesInitial extends GetMessagesState {}
final class GetAllMessageLoadingState extends GetMessagesState {}
final class GetAllMessageSuccessState extends GetMessagesState {}
