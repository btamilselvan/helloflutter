import 'package:flutter/material.dart';

class Basic extends StatelessWidget {
  final Widget fill = new Text('');

  // Basic({this.fill});

  Widget buildMain() {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Hello world'),
        leading: new Icon(Icons.menu),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 50.0), child: Icon(Icons.login))
        ],
      ),
      body: buildColumn(),
    );
  }

  Widget buildColumn() {
    return Column(
      textDirection: TextDirection.ltr,
      children: [
        buildRow("row 111 1 1"),
        new Divider(),
        buildRow("row 222 2 2"),
        new Divider(),
        buildRow("row 333 3 3")
      ],
    );
  }

  Widget buildRow(String value) {
    return new Row(
      textDirection: TextDirection.ltr,
      children: [new Text(value), Expanded(child: fill)],
    );
  }

  Widget buildMaterial() {
    return new Material(child: buildColumn());
  }

  @override
  Widget build(BuildContext context) {
    return buildMain();
  }

  // @override
  Widget build2(BuildContext context) {
    return buildMaterial();
  }

  // @override
  Widget build1(BuildContext context) {
    return new Material(
      child: Row(
        children: <Widget>[
          new Text(
            'Hello 1',
            textDirection: TextDirection.ltr,
            style: new TextStyle(color: Color.fromARGB(255, 255, 0, 0)),
          ),
          Expanded(child: fill),
          new Text(
            'Hello 222',
            textDirection: TextDirection.ltr,
            style: new TextStyle(color: Color.fromARGB(255, 45, 255, 200)),
          ),
          Expanded(child: fill),
          new Text(
            'Hello 333',
            textDirection: TextDirection.ltr,
            style: new TextStyle(color: Color.fromARGB(255, 45, 255, 200)),
          ),
          Expanded(child: fill)
        ],
        textDirection: TextDirection.ltr,
      ),
    );
  }
}
