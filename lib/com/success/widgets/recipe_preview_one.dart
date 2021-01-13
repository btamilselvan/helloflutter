import 'package:flutter/material.dart';
import 'package:wip/com/success/dto/recipes.dart';
import 'package:wip/com/success/services/services.dart';
import 'package:wip/com/success/widgets/recipe_detail.dart';

class RecipePreviewOne extends StatefulWidget {
  @override
  createState() => RecipePreviewOneState();
}

class RecipePreviewOneState extends State<RecipePreviewOne> {
  static const String defaultRecipeImage = 'Nonerecipe.webp';
  Future<Recipes> recipes;

  RecipePreviewOneState() {
    print('load recipes....');
    this.recipes = SimpleService().getAllNewRecipes();
  }

  ImageProvider buildNetworkImage(String imageUrl) {
    // String prefix = imageUrl.substring(0, imageUrl.lastIndexOf('/') + 1);
    NetworkImage networkImage = NetworkImage(imageUrl);
    Image.network(imageUrl)
        .image
        .resolve(ImageConfiguration.empty)
        .addListener(ImageStreamListener((_, __) {}, onError: (_, __) {
          print('''image doesn't exist ''' + imageUrl);
          // networkImage = NetworkImage(prefix + defaultRecipeImage);
        }));
    return networkImage;
  }

  void viewRecipe(recipeId, context) {
    print(recipeId);
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => RecipeDetail(recipeId)));
  }

  void toggleRating(index) {
    print(index);
  }

  List<Widget> createWidgetsUsingContainer(Recipes r, context) {
    return r.data
        .map((e) => GestureDetector(
              onTap: () {
                viewRecipe(e.recipeId, context);
              },
              child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: buildNetworkImage(e.pictureUrl),
                          onError: (obj, st) {
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              print('unable to load .... ..... '+ e.recipeId);
                              String prefix = e.pictureUrl.substring(0, e.pictureUrl.lastIndexOf('/') + 1);
                              e.pictureUrl = prefix + defaultRecipeImage;
                              setState(() {});
                            });
                          })),
                  // height: 150,
                  // width: double.infinity,
                  // padding: EdgeInsets.only(bottom: 10.0),
                  // margin: EdgeInsets.only(left: 10.0, right: 0.0, top: 0.0, bottom: 0.0),
                  margin: EdgeInsets.all(5.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      padding: EdgeInsets.all(5.0),
                      height: 75,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(200, 223, 223, 223)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  GestureDetector(
                                    child:
                                        Icon(Icons.star, color: Colors.black45),
                                    onTap: () {
                                      toggleRating(1);
                                    },
                                  ),
                                  GestureDetector(
                                    child:
                                        Icon(Icons.star, color: Colors.black45),
                                    onTap: () {
                                      toggleRating(2);
                                    },
                                  ),
                                  GestureDetector(
                                    child:
                                        Icon(Icons.star, color: Colors.black45),
                                    onTap: () {
                                      toggleRating(3);
                                    },
                                  ),
                                  GestureDetector(
                                    child:
                                        Icon(Icons.star, color: Colors.black45),
                                    onTap: () {
                                      toggleRating(4);
                                    },
                                  ),
                                  GestureDetector(
                                    child:
                                        Icon(Icons.star, color: Colors.black45),
                                    onTap: () {
                                      toggleRating(5);
                                    },
                                  )
                                ],
                              ),
                              Text('${e.title}')
                            ],
                          ),
                          Column(
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [Icon(Icons.favorite)],
                            mainAxisAlignment: MainAxisAlignment.center,
                          )
                        ],
                      ),
                    ),
                  )),
            ))
        .toList();
    // return r.data.map((recipe) => Text(recipe.title)).toList();
  }

  @override
  Widget build(BuildContext context) {
    print('building....');

    var scaffold = Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Recipes'),
      ),
      body: FutureBuilder(
        future: recipes,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.extent(
              padding: EdgeInsets.all(5.0),
              maxCrossAxisExtent: 1000,
              children: createWidgetsUsingContainer(snapshot.data, context),
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
    print('build end....');
    return scaffold;
  }
}
