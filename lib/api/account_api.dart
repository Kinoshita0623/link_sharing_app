

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:linksharingapp/api/util.dart';
import 'package:linksharingapp/models/account.dart';

class AccountAPI{

  String _token;

  Map<String, String> _header;

  set token(String value) {
    _setHeader(value);
    _token = value;
  }

  final String baseUrl;
  AccountAPI({ @required this.baseUrl, String token}){
    _setHeader(token);
    _token = token;
  }

  void _setHeader(String token){
    if(token != null && token.isNotEmpty){
      _header = createAuthHeader(token);
    }else{
      _header = createBaseHeader();
    }
  }

  Future<Account> login({ @required String email, @required String password, String deviceName = "flutter client"}) async{

    final data = {
      'email': email,
      'password': password,
      'device_name': deviceName
    };

    final response = await http.post('$baseUrl/api/login', headers: _header, body: jsonEncode(data));
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

    final response = await http.post('$baseUrl/api/register', headers: _header, body: jsonEncode(data));


  }


}