// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recipes _$RecipesFromJson(Map<String, dynamic> json) {
  return Recipes(
    (json['data'] as List)
        ?.map((e) =>
            e == null ? null : Recipe.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['total'] as int,
    json['start'] as int,
    json['end'] as int,
  );
}

Map<String, dynamic> _$RecipesToJson(Recipes instance) => <String, dynamic>{
      'data': instance.data?.map((e) => e?.toJson())?.toList(),
      'total': instance.total,
      'start': instance.start,
      'end': instance.end,
    };
