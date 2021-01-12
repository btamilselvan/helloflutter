import 'package:flutter/material.dart';
import 'dart:convert' show jsonDecode;
import 'package:json_annotation/json_annotation.dart';

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
  static const String statefulScreenName = '/stateful-test';
  static const String listScreenName = '/list-test';
  static const String flexListScreenName = '/flex-list';
  static const String navigationScreenName = '/nav-test';
  static const String httpTestScreenName = '/http-test';
  static const String recipePreviewTestScreenName = '/recipe-preview-test';
}

class Data {
  final String name;

  Data(this.name);
}
