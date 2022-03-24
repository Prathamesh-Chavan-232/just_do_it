import 'package:flutter/material.dart';

class TimeTable {
  String title;
  String slot;
  String prof;
  Color lineclr;
  TimeTable(
      {this.title = '',
      this.prof = '',
      required this.slot,
      required this.lineclr});

  static List<TimeTable> generateTimeTable() {
    return [
      TimeTable(
          title: '',
          slot: '7:00 - 8:00pm',
          lineclr: Colors.grey.withOpacity(0.3)),
      TimeTable(
          title: 'DSA Class',
          prof: 'Prof kim',
          slot: '9:00 am - 10:00 am',
          lineclr: Colors.purple.withOpacity(0.3)),
      TimeTable(
          title: '',
          slot: '10:00 am - 11:00 am',
          lineclr: Colors.grey.withOpacity(0.3)),
      TimeTable(
          title: '',
          slot: '11:00 am - 12:00 pm',
          lineclr: Colors.grey.withOpacity(0.3)),
      TimeTable(
          title: '',
          slot: '12:00 pm - 1:00 pm',
          lineclr: Colors.grey.withOpacity(0.3)),
      TimeTable(
          title: 'DSA lab',
          slot: '1:00 pm',
          prof: 'Prof kim',
          lineclr: Colors.purple.withOpacity(0.3)),
      TimeTable(
          title: 'DSA lab',
          slot: '2:00 pm',
          prof: 'Prof kim',
          lineclr: Colors.purple.withOpacity(0.3)),
      TimeTable(
          title: 'DSA lab',
          slot: '3:00 pm',
          prof: 'Prof kim',
          lineclr: Colors.purple.withOpacity(0.3)),
      TimeTable(
          title: 'DSA lab',
          slot: '4:30 pm',
          prof: 'Prof kim',
          lineclr: Colors.purple.withOpacity(0.3)),
    ];
  }
}

// TimeTable(title: 'OS Class', day: 'Tue', time: '9', slot: '9:00 am - 10:00 am'),
// TimeTable(title: 'OS lab', day: 'Tue', time: '13', slot: '1:00 pm - 4:30 pm'),
// TimeTable(title: 'Java Class', day: 'Wed', time: '9', slot: '9:00 am - 10:00 am'),
// TimeTable(title: 'Java lab', day: 'Wed', time: '13', slot: '1:00 pm - 4:30 pm'),
