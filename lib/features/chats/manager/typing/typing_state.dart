part of 'typing_cubit.dart';

@immutable
sealed class TypingState {}

final class TypingInitial extends TypingState {}
final class UserTypingSuccessState extends TypingState {}
final class UserTypingErrorState extends TypingState {}
final class ListenToUserTypingState extends TypingState {}
