import 'package:flutter/material.dart';
import 'package:wip/com/success/dto/recipes.dart';
import 'package:wip/com/success/widgets/services.dart';

class RecipePreview extends StatelessWidget {
  Future<Recipes> recipes;

  RecipePreview() {
    this.recipes = SimpleService().getAllNewRecipes();
  }

  List<Widget> createGridTileWidgets(Recipes r) {
    return r.data
        .map((e) => GridTile(
              footer: Text(e.title),
              child: Container(
                  decoration: BoxDecoration(
                      image:
                          DecorationImage(image: NetworkImage(e.pictureUrl))),
                  // height: 150,
                  // width: double.infinity,
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(e.title),
                  )),
            ))
        .toList();
  }

  List<Widget> createCardWidgets(Recipes r) {
    return r.data
        .map((e) => Card(
              child: Container(
                  decoration: BoxDecoration(
                      image:
                          DecorationImage(image: NetworkImage(e.pictureUrl))),
                  // height: 150,
                  // width: double.infinity,
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(e.title),
                  )),
            ))
        .toList();
  }

  List<Widget> createTextWidgets(Recipes r) {
    return r.data
        .map((e) => Container(
            decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(e.pictureUrl))),
            // height: 150,
            // width: double.infinity,
            padding: EdgeInsets.only(bottom: 10.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(e.title),
            )))
        .toList();
    // return r.data.map((recipe) => Text(recipe.title)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe'),
      ),
      body: FutureBuilder(
        future: recipes,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.extent(
              padding: EdgeInsets.all(5.0),
              maxCrossAxisExtent: 1000,
              children: createGridTileWidgets(snapshot.data),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50,
          child: Center(
            child: Text('Bottom'),
          ),
        ),
      ),
    );
  }
}
