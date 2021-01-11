import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wip/com/success/widgets/util.dart';

class ScreenOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: new Text('Navigation and Selection Test')),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(2.0),
          child: ElevatedButton(
            child: new Text('Make a selection'),
            onPressed: () => makeASelection(context),
          ),
        ),
      ),
    );
  }

  void makeASelection(BuildContext context) async {
    var result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => ScreenTwo()));

    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    if (result != null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('$result')));
    }
  }
}

class ScreenTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Make a selection'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: ElevatedButton(
                child: Text('Yes'),
                onPressed: () {
                  Navigator.pop(context, 'Yes');
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: ElevatedButton(
                child: Text('No'),
                onPressed: () {
                  Navigator.pop(context, 'No');
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ScreenThree extends StatelessWidget {
  final Data data;

  ScreenThree(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Date is ${data.name}')
      ),
      body: Center(child: new Text('You have clicked the item ${data.name}')),
    );
  }
}
