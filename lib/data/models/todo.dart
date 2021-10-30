import 'package:flutter/material.dart';

class TodoModel {
  String id;
  String name;
  DateTime deadlineDate;
  TimeOfDay deadlineTime;
  bool isFinished;

  TodoModel({
    required this.id,
    required this.name,
    required this.deadlineDate,
    required this.deadlineTime,
    required this.isFinished
  });
}