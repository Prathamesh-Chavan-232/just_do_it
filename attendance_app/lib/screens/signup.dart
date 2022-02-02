import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 60),
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
          const SizedBox(height: 30),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 5),
            child: Text(
              "Hello!, let's Create your account",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
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
                hintText: "Phone number",
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
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Re-enter password",
              ),
            ),
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
              child: const Text("SIGN-UP",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                  child: Container(
                      width: 120,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(16),
                      ))),
              Center(
                  child: Container(
                      width: 120,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(16),
                      ))),
            ],
          ),
        ],
      ),
    );
  }
}
