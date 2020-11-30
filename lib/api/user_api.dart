
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:linksharingapp/models/user.dart';
import 'package:linksharingapp/api/page.dart';
import 'package:linksharingapp/models/note.dart';
import 'package:http/http.dart' as http;
import 'package:linksharingapp/api/util.dart';

class UserAPI{

  final String baseUrl;
  UserAPI(this.baseUrl);

  Future<User> follow({@required String token, @required int userId }) async{
    final response = await http.post('$baseUrl/api/users/$userId', headers: createHeader(token: token));
    toException(response);

    return User.fromJson(jsonDecode(response.body));
  }

  Future<User> unfollow({@required String token, @required int userId }) async {
    final response = await http.delete('$baseUrl/api/users/$userId', headers: createHeader(token: token));
    toException(response);
    return User.fromJson(jsonDecode(response.body));
  }

  Future<User> get({ String token, @required int userId }) async {
    final response = await http.get('$baseUrl/api/users/$userId', headers: createHeader(token: token));
    toException(response);
    return User.fromJson(jsonDecode(response.body));
  }

  Future<PageData<Note>> notes({ String token, @required int userId, int page}) async{
    final response = await http.get('$baseUrl/api/users/$userId/notes', headers: createHeader(token: token));
    toException(response);
    return PageData.fromJson(jsonDecode(response.body), (json) => Note.fromJson(json));
  }

  Future<PageData<Note>> favoriteNotes({ String token, @required int userId, int page = 1}) async{
    final response = await http.get('$baseUrl/api/users/$userId/notes', headers: createHeader(token: token));
    toException(response);
    return PageData.fromJson(jsonDecode(response.body), (json) => Note.fromJson(json));
  }

  Future<PageData<User>> followers({ String token, @required int userId, int page = 1}) async{
    final response = await http.get('$baseUrl/api/users/$userId/followers', headers: createHeader(token: token));
    toException(response);
    return PageData.fromJson(jsonDecode(response.body), (json) => User.fromJson(json));
  }

  Future<PageData<User>> followings({ String token, @required int userId, int page = 1}) async{
    final response = await http.get('$baseUrl/api/users/$userId/followings', headers: createHeader(token: token));
    toException(response);
    return PageData.fromJson(jsonDecode(response.body), (json) => User.fromJson(json));
  }
}