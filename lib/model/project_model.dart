import 'package:flutter/material.dart';

class ProjectModel {
  String name;
  String description;
  String course;
  String releaseDate;
  String language;
  String status;
  Type type;
  String platform;
  String kitOrEditor;
  List<String> imagePath = [];
  Function onTap;

  ProjectModel({
    @required this.name,
    @required this.description,
    @required this.course,
    @required this.releaseDate,
    @required this.language,
    @required this.status,
    @required this.type,
    @required this.platform,
    @required this.kitOrEditor,
    @required this.imagePath,
    @required this.onTap,
  });
}

enum Type {
  versity,
  personal,
  future,
}
