import 'dart:async';
import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:github_users/model/user_model.dart';
import 'package:github_users/repo/repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc({@required this.repository}) : super(Loading(isLoading: true));

  final Repository repository;
  List<User> users = [];

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is FetchData) {
      yield Loading(isLoading: true);
      // print(state);
      try {
        users = await repository.getUsers(repository.urlUsers);
        yield Loaded(users: users);
        // print(state);
      } catch (e) {
        print('errorData: $e');
        yield Error();
      } finally {
        yield Loading(isLoading: false);
        // print(state);
      }
    }
    // if (event is DetailData) {
    //   var postStr = await repository.loadJsonStr(
    //       repository.urlPosts, Repository.postsModel);
    //   posts = postFromJson(postStr);
    //   yield UserDetail(
    //     user: users[event.id],
    //     post: posts,
    //   );
    // }
  }
}
