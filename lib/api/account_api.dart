

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:linksharingapp/api/util.dart';
import 'package:linksharingapp/models/account.dart';
import 'package:linksharingapp/models/user.dart';

class AccountAPI{


  final String baseUrl;
  AccountAPI({ @required this.baseUrl});


  Future<Account> login({ @required String email, @required String password, String deviceName = "flutter client"}) async{

    final data = {
      'email': email,
      'password': password,
      'device_name': deviceName
    };

    final response = await http.post('$baseUrl/api/login', headers: createHeader(), body: jsonEncode(data));
    toException(response);
    return Account.fromJson(jsonDecode(response.body));
  }

  Future<Account> register({
    @required String email,
    @required String userName,
    @required String password,
    @required String passwordConfirmation,
    String deviceName = "flutter client"
  }) async{
    final data = {
      'email': email,
      'user_name': userName,
      'password': password,
      'password_confirmation': passwordConfirmation,
      'device_name': deviceName
    };

    final response = await http.post('$baseUrl/api/register', headers: createHeader(), body: jsonEncode(data));
    toException(response);
    return Account.fromJson(jsonDecode(response.body));

  }


  Future<User> me(String token) async{
    final response = await http.get('$baseUrl/api/me', headers: createHeader(token: token));
    toException(response);
    return User.fromJson(jsonDecode(response.body));
  }
}