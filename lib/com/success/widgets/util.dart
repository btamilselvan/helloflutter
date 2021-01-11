import 'package:flutter/material.dart';
import 'dart:convert' show jsonDecode;

class ScreenArguments {
  final String name;
  final String value;

  ScreenArguments(this.name, this.value);
}

class Constants {
  static const String homeScreenName = '/home';
  static const String formScreenName = '/form-test';
  static const String imageScreenName = '/image-test';
  static const String carouselScreenName = '/carousel-image-test';
  static const String listScreenName = '/list-test';
  static const String flexListScreenName = '/flex-list';
  static const String navigationScreenName = '/nav-test';
}

class Data {
  final String name;

  Data(this.name);
}

class RecipesDtos {
  List<RecipeDto> data;
  int total;
  int start;
  int end;

  RecipesDtos(Map<String, dynamic> json) {
    final _recipeList = json['data'];
  }

  factory RecipesDtos.fromJson(Map<String, dynamic> json) {
    return RecipesDtos(json);
  }
}

class RecipeDto {
  String recipeId;
  String title;
  String pictureUrl;
  String preparationTime;
  String portion;
  String createdDate;
  String titleForUrl;
}
