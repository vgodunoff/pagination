import 'dart:convert';

DetailUser detailUserFromJson(String str) =>
    DetailUser.fromJson(json.decode(str));

class DetailUser {
  String name;
  dynamic email;
  String avatarUrl;
  String company;
  int followers;
  int following;
  DateTime createdAt;

  DetailUser({
    this.avatarUrl,
    this.name,
    this.email,
    this.company,
    this.following,
    this.followers,
    this.createdAt,
  });

  factory DetailUser.fromJson(Map<String, dynamic> json) => DetailUser(
        avatarUrl: json["avatar_url"],
        name: json["name"],
        company: json["company"],
        email: json["email"],
        followers: json["followers"],
        following: json["following"],
        createdAt: DateTime.parse(json["created_at"]),
      );
}
