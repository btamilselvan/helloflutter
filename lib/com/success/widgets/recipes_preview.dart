import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wip/com/success/dto/recipes.dart';
import 'package:wip/com/success/services/services.dart';
import 'package:wip/com/success/widgets/recipe_detail.dart';

class RecipePreview extends StatelessWidget {
  Future<Recipes> recipes;
  static const String defaultRecipeImage = 'Nonerecipe.webp';

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

  List<Widget> createWidgetsUsingContainerRowColumn(Recipes r) {
    r.data
        .map((e) => Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(e.pictureUrl))),
                        // margin: ,
                      ))
                    ],
                  )
                ],
              ),
            ))
        .toList();

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

  void toggleRating(index) {
    print(index);
  }

  void viewRecipe(recipeId, context) {
    print(recipeId);
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => RecipeDetail(recipeId)));
  }

  ImageProvider buildNetworkImage(context, String imageUrl) {
    String prefix = imageUrl.substring(0, imageUrl.lastIndexOf('/') + 1);
    NetworkImage nn;
    print('dasdas asdas d');
    bool exists = false;
    Image im = Image.network(imageUrl);
    ImageStream iss = im.image.resolve(ImageConfiguration.empty);

    iss.addListener(ImageStreamListener((info, call) {
      exists = true;
      nn = NetworkImage(imageUrl);
    }, onError: (dynamic exception, StackTrace stackTrace) {
      print('erer');
      exists = false;
      nn = NetworkImage(prefix + defaultRecipeImage);
    }));

    if (exists) {
      return NetworkImage(imageUrl);
    } else {
      return NetworkImage(prefix + defaultRecipeImage);
    }
    return nn;
    // return Image.network(imageUrl, errorBuilder:
    //     (BuildContext context, Object exception, StackTrace stackTrace) {
    //   print('error');
    //   return Image.network(prefix + defaultRecipeImage);
    // }).image;
  }

  void getCachedImage() {
    // CachedNetworkImageProvider();
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
                          image: buildNetworkImage(context, e.pictureUrl))),
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
                            crossAxisAlignment: CrossAxisAlignment.center,
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
    return Scaffold(
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
  }
}
