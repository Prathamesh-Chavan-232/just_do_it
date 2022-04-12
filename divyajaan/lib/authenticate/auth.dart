import 'package:flutter/material.dart';
import '../screens/auth_pages/login.dart';
import '../screens/auth_pages/signup.dart';

class Auth extends StatefulWidget {
  const Auth({Key? key}) : super(key: key);
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  late bool showSignIn;

  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  void initState() {
    showSignIn = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignIn(toggleView: toggleView);
    } else {
      return SignUp(toggleView: toggleView);
    }
  }
}
