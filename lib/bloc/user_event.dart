part of 'user_bloc.dart';

abstract class UserEvent {}

class FetchData extends UserEvent {}

class DetailData extends UserEvent {
  final String userName;

  DetailData({@required this.userName});
}
