import 'package:json_annotation/json_annotation.dart';

part 'recipe.g.dart';

@JsonSerializable()
class Recipe {
  final String recipeId;
  final String title;
  final String pictureUrl;
  final String preparationTime;
  final String portion;
  final String createdDate;
  final String titleForUrl;

  Recipe(this.recipeId, this.title, this.pictureUrl, this.preparationTime,
      this.portion, this.createdDate, this.titleForUrl);

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeToJson(this);
}
