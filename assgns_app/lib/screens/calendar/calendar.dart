import 'package:flutter/material.dart';
import '/screens/calendar/calendar_view.dart';
import '/screens/calendar/task_timeline.dart';
import 'package:assgns_app/models/timetable.dart';
import 'package:flutter/services.dart';


/*
* Renders the detailed Timeline view of tasks through out the day when clicked on a particular course.
*
*/

class Calendar extends StatelessWidget {
  const Calendar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final List<TimeTable> timeTable = TimeTable.generateTimeTable();
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.black));
    return Scaffold(
      backgroundColor: Colors.black,

      body: CustomScrollView(
        slivers: [
          _buildAppBar(context),
          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  CalendarView(), // Creates a minimalistic calendar
                  // Displays constant text present above the timeline
                ],
              ),
            ),
          ),

          if (timeTable.isEmpty)
            _noTasksToday()
          else
            _buildTimeline(
                timeTable), // Builds the tasks timeline if there are tasks scheduled
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.black,
      expandedHeight: 90,
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: const Icon(Icons.arrow_back_ios),
        iconSize: 20,
      ),
      actions: [
        IconButton(
            onPressed: () {}, icon: const Icon(Icons.more_vert, size: 30))
      ],
      flexibleSpace: FlexibleSpaceBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text("Calendar",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text("You have 2 lectures task(s) left today",
                style: TextStyle(fontSize: 11, color: Colors.grey[700]!)),
          ],
        ),
      ),
    );
  }



  SliverList _buildTimeline(List timeTable) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
            (_, i) => Timeline(Class: timeTable[i]),
            childCount: timeTable.length));
  }

  SliverFillRemaining _noTasksToday() {
    return SliverFillRemaining(
      child: Container(
        color: Colors.white,
        child: const Center(
          child: Text(
            "No Tasks Today",
            style: TextStyle(color: Colors.grey, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
