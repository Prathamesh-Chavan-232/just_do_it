import 'package:attendance_app/screens/calendar.dart';
import 'package:flutter/material.dart';
import 'screens/login.dart';
import 'screens/signup.dart';
import 'screens/home.dart';
import 'screens/courses.dart';
import 'screens/tasks.dart';
import 'screens/calendar.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/dashboard',
      routes: {
        '/login':(context) => const Login(),
        '/signup': (context) => const Signup(),
        '/dashboard': (context) => const Home(),
        '/courses': (context) => const Courses(),
        '/tasks':(context) => const Tasks(),
        '/calendar':(context) => const Calendar(),
      },
    );
  }
}



