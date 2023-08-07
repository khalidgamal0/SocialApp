part of 'chat_cubit.dart';

@immutable
abstract class ChatState {}

class ChatInitial extends ChatState {}
class GetAllUserSuccess extends ChatState {}
class GetAllUserError extends ChatState {
  final String error;
  GetAllUserError(this.error);
}
