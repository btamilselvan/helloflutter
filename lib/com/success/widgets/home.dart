import 'dart:math';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:wip/com/success/widgets/form_test.dart';
import 'package:wip/com/success/widgets/util.dart';

class Home extends StatelessWidget {
  static const screenName = '/home';
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Welcome home')),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
                'Navigate to different pages using the below buttons/links'),
          ),
          Row(
            children: [
              Padding(
                  padding: EdgeInsets.all(10.0),
                  child: new ElevatedButton(
                      onPressed: () => Navigator.pushNamed(
                          context, Constants.formScreenName,
                          arguments: ScreenArguments(
                              'hello', WordPair.random().asPascalCase)),
                      child: new Text('Form Test'))),
              Padding(
                  padding: EdgeInsets.all(10.0),
                  child: new ElevatedButton(
                      onPressed: () => Navigator.pushNamed(
                          context, Constants.imageScreenName,
                          arguments: ScreenArguments(
                              'hello', WordPair.random().asPascalCase)),
                      child: new Text('Image Test')))
            ],
          )
        ],
      ),
    );
  }
}
