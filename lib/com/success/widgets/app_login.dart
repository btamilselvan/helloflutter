import 'package:flutter/material.dart';

class AppLogin extends StatelessWidget {
  final _myLoginFormKey = GlobalKey();
  static const screenName = '/login-test';

  @override
  Widget build(BuildContext context) {
    return new Form(
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          new Padding(
            padding: EdgeInsets.all(10.0),
            child: new TextField(
                decoration: InputDecoration(hintText: 'Enter your email')),
          ),
          new Padding(
            padding: EdgeInsets.all(10.0),
            child: new TextField(
              decoration: InputDecoration(hintText: 'Enter your password'),
              obscureText: true,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child:
                ElevatedButton(onPressed: login, child: new Text('Login')),
          )
        ],
      ),
      key: _myLoginFormKey,
    );
  }

  void login(){
    print('clicked....');
    print(_myLoginFormKey.currentState);
  }
}
