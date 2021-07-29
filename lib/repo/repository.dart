import 'dart:convert';
import 'dart:core';
import 'dart:io';
import 'package:github_users/model/user_model.dart';

class Repository {
  final client = HttpClient();
  Uri urlUsers = Uri(
      scheme: 'https',
      host: 'api.github.com',
      path: 'users',
      query: 'since=0&per_page=10');

  Future<String> fetchJsonString(Uri url) async {
    final request = await client.getUrl(url);
    request.headers
        .set(HttpHeaders.acceptHeader, 'application/vnd.github.v3+json');
    final response = await request.close();
    final jsonStrings = await response.transform(utf8.decoder).toList();
    final jsonString = jsonStrings.join();

    return jsonString;
  }

  Future<List<User>> getUsers(Uri url) async {
    String str = await fetchJsonString(url);

    return userFromJson(str);
  }
}
