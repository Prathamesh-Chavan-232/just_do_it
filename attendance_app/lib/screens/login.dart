import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 100),
          Center(
            child: Container(
              width: 350,
              height: 75,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          const SizedBox(height: 50),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 5),
            child: Text("Welcome back! Let's get you signed in.",style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Email",
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Password",
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 5),
            child: Text("Forgot Password"),
          ),
          const SizedBox(height: 10),
          Center(
            child: Container(
              alignment: Alignment.center,
              width: 350,
              height: 55,
              decoration: BoxDecoration(
                color: const Color(0x8F5118EA),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Text("SIGN-IN",style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              )),
            ),
          ),
        ],

      ),
    );
  }
}
