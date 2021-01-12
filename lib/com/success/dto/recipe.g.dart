// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recipe _$RecipeFromJson(Map<String, dynamic> json) {
  return Recipe(
    json['recipeId'] as String,
    json['title'] as String,
    json['pictureUrl'] as String,
    json['preparationTime'] as String,
    json['portion'] as String,
    json['createdDate'] as String,
    json['titleForUrl'] as String,
  );
}

Map<String, dynamic> _$RecipeToJson(Recipe instance) => <String, dynamic>{
      'recipeId': instance.recipeId,
      'title': instance.title,
      'pictureUrl': instance.pictureUrl,
      'preparationTime': instance.preparationTime,
      'portion': instance.portion,
      'createdDate': instance.createdDate,
      'titleForUrl': instance.titleForUrl,
    };
