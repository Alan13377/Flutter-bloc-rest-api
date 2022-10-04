part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

//**Data loading state */
class UserLoadingState extends UserState {
  @override
  List<Object> get props => [];
}

//**Data Loaded State */
class UserLoadedState extends UserState {
  final List<UserModel> users;

  UserLoadedState(this.users);
  @override
  List<Object> get props => [users];
}

//**Data error loading state */

class ErrorLoadingState extends UserState {
  final String error;

  ErrorLoadingState(this.error);
  @override
  List<Object> get props => [error];
}
