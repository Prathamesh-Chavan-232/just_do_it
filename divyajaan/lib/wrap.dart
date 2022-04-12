import '/models/users.dart';
import '/screens/home_screen/home_page.dart';
import 'package:provider/provider.dart';
import '/authenticate/auth.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);
    print(user);
    // Return either Home or Auth widget.
    if (user == null) {
      return const Auth();
    } else {
      return const HomePage();
    }
  }
}