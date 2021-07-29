part of 'user_bloc.dart';

abstract class UserState {}

class Loading extends UserState {
  final bool isLoading;

  Loading({@required this.isLoading});
}

class Loaded extends UserState {
  final List<User> users;

  Loaded({@required this.users});
}

class Error extends UserState {}

class UserDetail extends UserState {}
