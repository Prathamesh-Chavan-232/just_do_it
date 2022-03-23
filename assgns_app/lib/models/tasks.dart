import 'package:flutter/material.dart';
import '/constants/google_theme.dart';

class Task {
  IconData? iconData;
  String? title;
  Color? bgclr;
  Color? iconclr;
  Color? btnclr;
  bool? islast;
  num? left;
  num? done;
  Task(
      {this.iconData,
        this.title,
        this.bgclr,
        this.iconclr,
        this.btnclr,
        this.left,
        this.done,
        this.islast = false});

  static List<Task> generateTasks() {
    return [
      Task(
        iconData: Icons.person_rounded,
        title: 'Personal',
        bgclr: kYellowLight,
        iconclr: kYellowDark,
        btnclr: kYellow,
        left: 3,
        done: 1,
      ),
      Task(
        iconData: Icons.cases_rounded,
        title: 'Work',
        bgclr: kRedLight,
        iconclr: kRedDark,
        btnclr: kRed,
        left: 2,
        done: 8,
      ),
      Task(
        iconData: Icons.favorite_rounded,
        title: 'Health',
        bgclr: kBlueLight,
        iconclr: kBlueDark,
        btnclr: kBlue,
        left: 1,
        done: 2,
      ),
      Task(islast: true),
    ];
  }
}