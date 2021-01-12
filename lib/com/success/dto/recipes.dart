import 'package:json_annotation/json_annotation.dart';
import 'package:wip/com/success/dto/recipe.dart';

part 'recipes.g.dart';

@JsonSerializable(explicitToJson: true)
class Recipes {
  final List<Recipe> data;
  final int total;
  final int start;
  final int end;

  Recipes(this.data, this.total, this.start, this.end);

  factory Recipes.fromJson(Map<String, dynamic> json) =>
      _$RecipesFromJson(json);
}
