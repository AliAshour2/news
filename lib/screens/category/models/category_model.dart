import 'package:flutter/material.dart';

class CategoryModel {
  final String id;
  final String? imagePath;
  final String title;
  final Color color;

  CategoryModel(
      {required this.id,
      this.imagePath,
      required this.title,
      required this.color});
}
