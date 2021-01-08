import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class Words extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var rand = WordPair.random();

    return MaterialApp(
        title: 'Hello Random',
        home: new Scaffold(
            appBar: AppBar(
              title: new Text(
                'Hello worlds',
                textAlign: TextAlign.center,
              ),
              leading: new Icon(Icons.menu),
              actions: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: Icon(Icons.search)
                ),
                new Padding(
                  padding: EdgeInsets.only(right: 50.0),
                  child: new Icon(Icons.logout),
                ),
              ],
            ),
            body: new Center(
              child: new Text(rand.asPascalCase),
            )));
  }
}

void main() => runApp(new Words());
