
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:linksharingapp/api/account_api.dart';
import 'package:linksharingapp/api/user_api.dart';
import 'package:linksharingapp/models/account.dart';
import 'package:linksharingapp/models/user.dart';

class AccountViewModel extends ChangeNotifier{

  AccountAPI _accountAPI;
  UserAPI _userAPI;

  Account _account;
  StreamController<Account> _accountEventController = StreamController<Account>.broadcast();
  StreamController<Exception> _errors = StreamController<Exception>.broadcast();

  Stream get accountEvent => _accountEventController.stream;
  Stream get errorEvent => _errors.stream;

  Account get account => _account;



  AccountViewModel({ @required AccountAPI accountAPI, @required UserAPI userAPI}){
    this._accountAPI = accountAPI;
    this._userAPI = userAPI;
  }

  void login({ @required String email, @required String password }){
    _accountAPI.login(email: email, password: password)
        .then((value){
          _updateAccount(value);
        })
        .catchError((error){
          _errors.add(error);
        });
  }

  void logout(){
    _account = null;
  }


  void createAccount({ String email, String userName, String password, String passwordConfirmation}){
    _accountAPI.register(email: email, userName: userName, password: password, passwordConfirmation: passwordConfirmation)
        .then((value){
          _updateAccount(value);
        })
        .catchError((error){
          _errors.add(error);
        });
  }

  void toggleFollow(User user){
    _toggleFollowAndUpdateMe(user)
        .then((value){
          _updateAccount(value);
        })
        .catchError((error){
          _errors.add(error);
        });
  }

  Future<Account> _toggleFollowAndUpdateMe(User user) async{
    User updated;
    if(user.isFollowing){
      updated = await _userAPI.unfollow(token: account?.token, userId: user.id);
    }else{
      updated = await _userAPI.follow(token: account?.token, userId: user.id);
    }

    if(user != updated){
      final me = await _accountAPI.me(account?.token);
      if(me != null){
        return account.copyWith(user: me);
      }

    }
    return null;
  }

  void _updateAccount(Account a){
    final before = _account;
    _account = a;
    _accountEventController.add(a);
    if(a == null || a.token != before.token){
      notifyListeners();
    }
  }
  @override
  void dispose() {
    super.dispose();

    if(this._accountEventController != null){
      this._accountEventController.close();
    }

    if(this._errors != null){
      this._errors.close();
    }
  }
}