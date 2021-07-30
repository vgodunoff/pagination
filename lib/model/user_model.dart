import 'dart:convert';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

class User {
  User({
    this.login,
    this.id,
    this.avatarUrl,
  });

  String login;
  int id;
  String avatarUrl;

  factory User.fromJson(Map<String, dynamic> json) => User(
        login: json["login"],
        id: json["id"],
        avatarUrl: json["avatar_url"],
      );
}
