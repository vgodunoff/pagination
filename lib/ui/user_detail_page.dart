import 'package:flutter/material.dart';
import 'package:github_users/model/detail_user.dart';

class UserPage extends StatelessWidget {
  final DetailUser detailUser;

  const UserPage({Key key, this.detailUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image(
            image: NetworkImage(detailUser.avatarUrl),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 12),
            child: Column(
              children: [
                RichText(
                  text: TextSpan(
                      text: 'Name of user - ',
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(text: detailUser.name ?? 'N/acceptable')
                      ]),
                ),
                RichText(
                  text: TextSpan(
                      text: 'Email - ',
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(text: detailUser.email ?? 'N/acceptable')
                      ]),
                ),
                RichText(
                  text: TextSpan(
                      text: 'Name of user\'s company - ',
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(text: detailUser.company ?? 'N/acceptable')
                      ]),
                ),
                RichText(
                  text: TextSpan(
                      text: 'following count - ',
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                            text: detailUser.following.toString() ??
                                'N/acceptable')
                      ]),
                ),
                RichText(
                  text: TextSpan(
                      text: 'followers - ',
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                            text: detailUser.followers.toString() ??
                                'N/acceptable')
                      ]),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
