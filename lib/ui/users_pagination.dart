import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_users/bloc/user_bloc.dart';
import 'package:github_users/ui/user_detail_page.dart';

class UsersList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) {
        if (state is Loading) {
          if (state.isLoading) {
            showDialog(
                context: context,
                builder: (context) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                });
          } else {
            Navigator.pop(context);
          }
        }
        if (state is UserDetail) {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return UserPage(detailUser: state.detailUser);
          }));
        }
      },
      buildWhen: (previous, current) => current is Loaded,
      builder: (context, state) {
        if (state is Loaded) {
          ScrollController controller = ScrollController();
          controller.addListener(() {
            print(controller.position.extentAfter);
            if (controller.position.extentAfter <= 0) {
              BlocProvider.of<UserBloc>(context).add(FetchData());
            }
          });

          return Scaffold(
            appBar: AppBar(),
            body: ListView.builder(
                controller: controller,
                itemCount: state.users.length,
                itemBuilder: (context, int index) {
                  return InkWell(
                    onTap: () {
                      BlocProvider.of<UserBloc>(context)
                          .add(DetailData(userName: state.users[index].login));
                    },
                    child: Card(
                      child: ListTile(
                        leading: Image(
                          image: NetworkImage(state.users[index].avatarUrl),
                        ),
                        title: Text(state.users[index].login),
                        subtitle: Text(state.users[index].id.toString()),
                      ),
                    ),
                  );
                }),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
