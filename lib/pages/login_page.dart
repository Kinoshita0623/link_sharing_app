

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:linksharingapp/viewmodel/account_vm.dart';
import 'package:provider/provider.dart';



class LoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }

}

class _LoginPageState extends State{

  // validationするために必要
  final _fromKey = GlobalKey<FormState>();

  final TextEditingController _inputEmail = TextEditingController();
  final TextEditingController _inputPassword = TextEditingController();

  AccountViewModel _accountViewModel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _accountViewModel = Provider.of<AccountViewModel>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ログイン")),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                  child: TextFormField(
                    controller: _inputEmail,
                    keyboardType: TextInputType.emailAddress,

                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      hintText: "メールアドレス"
                    ),
                  )
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                  child: TextFormField(
                    controller: _inputPassword,
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.vpn_key),
                      hintText: "パスワード"
                    ),

                  )
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: FlatButton(
                    padding: EdgeInsets.only(top: 5,bottom: 5,left: 20,right: 20),
                    color: Theme.of(context).primaryColor,
                    child: Text(
                      'ログイン',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0
                      ),
                    ),
                    onPressed: (){
                      _tryLogin();
                    },
                  ),
                )
              ],
            )
        )
      )
    );

  }

  void _tryLogin(){
    _accountViewModel.login(
      email: _inputEmail.text,
      password: _inputPassword.text
    ).then((value){

    })
    .catchError((e){
      print('error:$e');
    });
  }

  @override
  void dispose() {
    _inputEmail.clear();
    _inputPassword.clear();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
}