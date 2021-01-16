import 'package:flutter/material.dart';

class FeedbackModel {
  int userIndex;
  String name;
  String msg;
  DateTime time;

  FeedbackModel({
    @required int userIndex,
    @required String name,
    @required String msg,
    @required DateTime time,
  });
}
