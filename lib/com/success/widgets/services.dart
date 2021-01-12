import 'package:http/http.dart' as http;
import 'package:wip/com/success/dto/recipe.dart';
import 'package:wip/com/success/dto/recipes.dart';
import 'package:wip/com/success/widgets/util.dart';
import 'dart:convert' show jsonDecode;

class SimpleService {
  void getRecipeById(String recipeId) {}

  Future<Recipes> getAllNewRecipes() async {
    print('before call');
    final response = await http.get(
        'https://dev.reciperm.com/services/recipe/p/get-new-recipes',
        headers: {'z-api-key': 'vzIJKQ7LPbNLF6'});

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      Recipes dtos = Recipes.fromJson(data['data']);
      print(dtos.total);

      print('after call');

      return dtos;
    } else {
      throw Exception('unable to retrieve data...');
    }
  }
}
