
import 'package:flutter/cupertino.dart';
import 'package:linksharingapp/models/user.dart';
import 'package:linksharingapp/api/page.dart';
import 'package:linksharingapp/models/note.dart';
import 'package:http/http.dart';

class UserAPI{

  final String baseUrl;
  UserAPI(this.baseUrl);

  Future<User> follow({@required String token, @required int userId }){

  }

  Future<User> unfollow({@required String token, @required int userId }){

  }

  Future<User> get({ String token, @required int userId }){

  }

  Future<PageData<Note>> notes({ String token, @required int userId, int page}){

  }

  Future<PageData<Note>> favoriteNotes({ String token, @required int userId, int page = 1}){

  }

  Future<PageData<User>> followers({ String token, @required int userId, int page = 1}){

  }

  Future<PageData<User>> followings({ String token, @required int userId, int page = 1}){

  }
}