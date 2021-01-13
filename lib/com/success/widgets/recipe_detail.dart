import 'package:flutter/material.dart';
import 'package:wip/com/success/dto/recipe.dart';
import 'package:wip/com/success/services/services.dart';

class RecipeDetail extends StatelessWidget {
  final String recipeId;
  Future<Recipe> recipe;

  RecipeDetail(this.recipeId) {
    recipe = SimpleService().getRecipeById(recipeId);
  }

  List<Widget> getPreparationTableRow(Recipe r) {
    List<Widget> l = List.filled(3, null);
    l[0] = Text('Prep time ${r.preparationTime}');
    l[1] = Text('Prep time ${r.preparationTime}');
    l[2] = Text('Prep time ${r.preparationTime}');
    return l;
  }

  Widget buildWidgetUsingSingleChildScrollView(Recipe r, BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(5.0),
      child: Container(
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [Center(child: Text(r.title))],
                )),
            Container(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              child: Icon(Icons.star, color: Colors.black45),
                              onTap: null,
                            ),
                            GestureDetector(
                              child: Icon(Icons.star, color: Colors.black45),
                              onTap: null,
                            ),
                            GestureDetector(
                              child: Icon(Icons.star, color: Colors.black45),
                              onTap: null,
                            ),
                            GestureDetector(
                              child: Icon(Icons.star, color: Colors.black45),
                              onTap: null,
                            ),
                            GestureDetector(
                              child: Icon(Icons.star, color: Colors.black45),
                              onTap: null,
                            ),
                            SizedBox(width: 10),
                            Text('(10)')
                          ],
                        )
                      ],
                    ),
                    Column(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [Icon(Icons.favorite)],
                      mainAxisAlignment: MainAxisAlignment.center,
                    )
                  ],
                )),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Table(
                border: TableBorder.all(),
                children: [TableRow(children: getPreparationTableRow(r))],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Recipe')),
      body: FutureBuilder(
          future: recipe,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return buildWidgetUsingSingleChildScrollView(
                  snapshot.data, context);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }
}
