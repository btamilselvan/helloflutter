import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
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
          Padding(
              padding: EdgeInsets.all(10.0),
              child: new ElevatedButton(
                  onPressed: () => Navigator.pushNamed(
                      context, Constants.recipePreviewTestScreenName,
                      arguments: ScreenArguments(
                          'hello', WordPair.random().asPascalCase)),
                  child: new Text('Recipe Preview'))),
          Padding(
              padding: EdgeInsets.all(10.0),
              child: new ElevatedButton(
                  onPressed: () => Navigator.pushNamed(
                      context, Constants.networkImageTestScreenName,
                      arguments: ScreenArguments(
                          'hello', WordPair.random().asPascalCase)),
                  child: new Text('Network image test'))),
          Container(
            height: 50,
            child: ListView(
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
                        child: new Text('Image Test'))),
                Padding(
                    padding: EdgeInsets.all(10.0),
                    child: new ElevatedButton(
                        onPressed: () => Navigator.pushNamed(
                            context, Constants.listScreenName),
                        child: new Text('List Test'))),
                Padding(
                    padding: EdgeInsets.all(10.0),
                    child: new ElevatedButton(
                        onPressed: () => Navigator.pushNamed(
                            context, Constants.navigationScreenName),
                        child: new Text('Navigation Test'))),
                Padding(
                    padding: EdgeInsets.all(10.0),
                    child: new ElevatedButton(
                        onPressed: () => Navigator.pushNamed(
                            context, Constants.flexListScreenName),
                        child: new Text('Flexible List Test'))),
                Padding(
                    padding: EdgeInsets.all(10.0),
                    child: new ElevatedButton(
                        onPressed: () => Navigator.pushNamed(
                            context, Constants.carouselScreenName),
                        child: new Text('Carousel Images Test'))),
                Padding(
                    padding: EdgeInsets.all(10.0),
                    child: new ElevatedButton(
                        onPressed: () => Navigator.pushNamed(
                            context, Constants.httpTestScreenName),
                        child: new Text('Http Test'))),
                Padding(
                    padding: EdgeInsets.all(10.0),
                    child: new ElevatedButton(
                        onPressed: () => Navigator.pushNamed(
                            context, Constants.statefulScreenName),
                        child: new Text('Stateful Test')))
              ],
              scrollDirection: Axis.horizontal,
            ),
          )
        ],
      ),
    );
  }
}
