import 'package:flutter/material.dart';

class MyStatefulWidget extends StatefulWidget {
  @override
  createState() => MyCounterState();
}

class MyCounterState extends State<MyStatefulWidget> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: [
        new MyCounter(counter: this.counter),
        new MyIncrementer(onPressed: this.increment),
        new MyDecrementer(onPressed: this.decrement)
      ],
    );
  }

  void increment() {
    setState(() {
      ++counter;
    });
  }

  void decrement() => setState(() {
        --counter;
      });
}

class MyCounter extends StatelessWidget {
  final int counter;
  MyCounter({this.counter});

  @override
  Widget build(BuildContext context) {
    return new Text('Count is: $counter ');
  }
}

class MyIncrementer extends StatelessWidget {
  final VoidCallback onPressed;

  MyIncrementer({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: EdgeInsets.all(10.0),
      child: ElevatedButton(
        child: new Text('Increment'),
        onPressed: onPressed,
      ),
    );
  }
}

class MyDecrementer extends StatelessWidget {
  final VoidCallback onPressed;

  MyDecrementer({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: EdgeInsets.all(10.0),
      child: ElevatedButton(
        child: new Text('Decrement'),
        onPressed: onPressed,
      ),
    );
  }
}
