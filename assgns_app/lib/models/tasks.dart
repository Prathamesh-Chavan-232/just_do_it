import 'package:flutter/material.dart';
import '/constants/default_theme.dart';

class Task {
  String? courseTitle;
  String? title;
  Color? iconclr;
  Task({this.courseTitle, this.title, this.iconclr});

  static generateTasks() {

    tasksList.shuffle();
    return tasksList;
  }
}
var tasksList = [
  Task(
      courseTitle: 'Operating systems',
      title: 'Os Assignment 1',
      iconclr: kPink),
  Task(
      courseTitle: 'Operating systems',
      title: 'Os Assignment 2',
      iconclr: kPink),
  Task(
      courseTitle: 'Operating systems',
      title: 'Os Assignment 3',
      iconclr: kPink),
  Task(
      courseTitle: 'Data structures',
      title: 'DS Assignment 1',
      iconclr: kButtonClr),
  Task(
      courseTitle: 'Data structures',
      title: 'DS Assignment 2',
      iconclr: kButtonClr),
  Task(
      courseTitle: 'Data structures',
      title: 'DS Assignment 3',
      iconclr: kButtonClr),
];

