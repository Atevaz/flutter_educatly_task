part of 'send_message_cubit.dart';

@immutable
sealed class SendMessageState {}

final class SendMessageInitial extends SendMessageState {}
final class SendMessageSuccessState extends SendMessageState {}
final class SendMessageErrorState extends SendMessageState {}
