import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wip/com/success/services/services.dart';

class MyHttpTest extends StatelessWidget {

  void getAllNewRecipes(){
    print('get all new recipes ...');
    var dtos = SimpleService().getAllNewRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Http Test'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 70,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: ElevatedButton(
                      child: Text('Http Get'),
                      onPressed: getAllNewRecipes,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
