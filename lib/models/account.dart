

import 'package:flutter/cupertino.dart';
import 'package:linksharingapp/models/user.dart';

class Account{

  final String token;
  final User user;

  Account({ @required this.token, @required this.user });

  factory Account.fromJson(Map<String, dynamic> json){
    return Account(
      token: json['token'],
      user: User.fromJson(json['user'])
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Account &&
              runtimeType == other.runtimeType &&
              token == other.token &&
              user == other.user;

  @override
  int get hashCode => token.hashCode ^ user.hashCode;
}