import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_users/bloc/user_bloc.dart';
import 'package:github_users/repo/repository.dart';
import 'package:github_users/ui/home.dart';
import 'package:github_users/ui/users_pagination.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final repository = Repository();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<UserBloc>(
        create: (BuildContext context) =>
            UserBloc(repository: repository)..add(FetchData()),
        child: UsersList(),
      ),
    );
  }
}
