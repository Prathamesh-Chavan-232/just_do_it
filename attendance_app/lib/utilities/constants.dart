import 'package:flutter/material.dart';

// padding
const double vp = 10.0;
const double hp = 20.0;

//Colors
const Color cardClr = Color.fromARGB(255, 104, 115, 141);
const Color kYellowLight = Color(0xFFFFF7EC);
const Color kYellow = Color(0xFFFAF0DA);
const Color kYellowDark = Color(0xFFEBBB7F);

const Color kRedLight = Color(0xFFFCF0F0);
const Color kRed = Color(0xFFFBE4E6);
const Color kRedDark = Color(0xFFF08A8E);

const Color kBlueLight = Color(0xFFEDF4FE);
const Color kBlue = Color(0xFFE1EDFC);
const Color kBlueDark = Color(0xFFC0D3F8);


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