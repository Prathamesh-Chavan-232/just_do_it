import '/constants/default_theme.dart';
import 'package:flutter/material.dart';
import '/models/tasks.dart';

class Course {
  String? title;
  Color? courseClr;
  num? left;
  num? done;
  Color? tlcolor = Colors.purple.withOpacity(0.3);
  Color? bgcolor = Colors.purple.withOpacity(0.7);
  List<Task>? assgns;
  Course({this.title, this.courseClr, this.done, this.left});
  static List<Course> generateCourses() {
    return [
      Course(
        title: 'Operating Systems',
        courseClr: kPink,
        done: 3,
        left: 4,
      ),
      Course(
        title: 'Data structures',
        courseClr: kButtonClr,
        done: 3,
        left: 4,
      ),
      Course(
        title: 'Java',
        courseClr: kPink,
        done: 3,
        left: 4,
      ),
      Course(
        title: 'Python',
        courseClr: kPink,
        done: 3,
        left: 4,
      ),
    ];
  }
}

