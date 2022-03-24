import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '/constants/default_theme.dart';
import '/models/courses.dart';
import '/models/tasks.dart';
import 'package:provider/provider.dart';
import '/services/database.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late bool isComplete;
  List<Course> courses = Course.generateCourses();
  @override
  void initState() {
    isComplete = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final students = Provider.of<QuerySnapshot?>(context);
    // print(students!.docs);

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
            child: Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20, left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  "Hi, Prathamesh!",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: kText2,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 25, bottom: 15, left: 10),
                child: Text(
                  "Courses",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: kText,
                  ),
                ),
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, i) => _courseTile(courses[i]),
                  itemCount: courses.length,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20.0, left: 10),
                child: Text("Assignments",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: kText,
                    )),
              ),
            ],
          ),
        )),
        SliverList(
          delegate: SliverChildBuilderDelegate(
              (context, i) => _taskTile(i, tasksList[i], tasksList),
              childCount: tasksList.length),
        )
      ],
    );
  }

  Widget _taskTile(int i, Task task, List tasks) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Container(
        width: double.infinity,
        height: 80,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                _taskAvatar(tasks, task.iconclr, i),
                Text("   ${task.title}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: kText,
                    )),
              ],
            )),
      ),
    );
  }

  Widget _taskAvatar(List tasks, Color? iconclr, int i) {
    return GestureDetector(
      onTap: () {
        setState(() {
          tasks.removeAt(i);
        });
      },
      child: CircleAvatar(
        radius: 15,
        backgroundColor: Colors.white,
        child:Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: iconclr!, width: 3)),
        ),
      ),
    );
  }

  Widget _courseTile(Course course) {
    return GestureDetector(
      key: ValueKey(course),
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(right: 12.0, bottom: 20),
        child: Container(
          height: 80,
          width: 250,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(12)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${course.left} Tasks left",
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: kText,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                course.title!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: kText2,
                ),
              ),
              const SizedBox(height: 40),
              Row(
                children:  [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Text(
                      "2 lectures",
                      style:  TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: kText,
                      ),
                    ),
                  ),
                  const SizedBox(width: 40),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      "2  labs",
                      style:  TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: kText,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
