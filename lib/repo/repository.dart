import 'dart:convert';
import 'dart:core';
import 'dart:io';
import 'package:github_users/model/detail_user.dart';
import 'package:github_users/model/user_model.dart';

class Repository {
  final client = HttpClient();
  int since = 0;
  List<User> users = [];

  Future<String> fetchJsonString(bool isPaginated, String userName,
      [String since]) async {
    Uri url = isPaginated
        ? Uri.parse('https://api.github.com/users?since=$since&per_page=10')
        : Uri.parse('https://api.github.com/users/$userName');
    final request = await client.getUrl(url);
    request.headers
        .set(HttpHeaders.acceptHeader, 'application/vnd.github.v3+json');
    final response = await request.close();
    final jsonStrings = await response.transform(utf8.decoder).toList();
    final jsonString = jsonStrings.join();
    return jsonString;
  }

  Future<List<User>> getPagiUsers() async {
    String str = await fetchJsonString(true, '', since.toString());
    List<User> tmp = userFromJson(str);
    users.addAll(tmp);
    since += 10;

    return users;
  }

  Future<DetailUser> getDetailSingleUser(
      bool isPaginated, String userName) async {
    String str = await fetchJsonString(isPaginated, userName, null);

    return detailUserFromJson(str);
  }
}
