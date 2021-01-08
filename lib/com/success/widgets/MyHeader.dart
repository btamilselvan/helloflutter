import 'package:flutter/material.dart';

class MyHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appBar = new AppBar(
      title: new Text(''),
      leading: Icon(Icons.menu),
    );
    return appBar;
  }
}
