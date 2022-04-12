import '/services/auth_service.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  const SignIn({required this.toggleView, Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  late String _email;
  late String _pass;
  late bool _hidePassword;

  @override
  void initState() {
    _email = '';
    _pass = '';
    _hidePassword = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Sign-in page"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              const SizedBox(height: 20),
              TextFormField(
                onChanged: (val) {
                  setState(() => _email = val);
                },
                decoration: InputDecoration(
                    hintText: "Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    )),
              ),
              const SizedBox(height: 20),
              _buildFormField(hintText: "Password"),
              const SizedBox(height: 20),
              _switchToSignup(),
              Center(
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  child: _loginInButton(),
                ),
              ),
              const Spacer(),
              Container(
                padding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                child: _signInAnonButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _switchToSignup() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account?, ",
            style: TextStyle(color: Colors.grey)),
        TextButton(
          onPressed: () {
            widget.toggleView();
          },
          child: const Text(
            "Sign-up",
            style: TextStyle(
                color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.grey[100]),
          ),
        )
      ],
    );
  }

  TextFormField _buildFormField({required String hintText}) {
    return TextFormField(
      onChanged: (val) {
        setState(() => _pass = val);
      },
      decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: IconButton(
            onPressed: () {
              setState(() => _hidePassword = !_hidePassword);
            },
            icon: Icon(_hidePassword ? Icons.visibility_off : Icons.visibility),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
          )),
      obscureText: _hidePassword,
    );
  }

  ElevatedButton _loginInButton() {
    return ElevatedButton(
      style:
      ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white)),
      onPressed: () async {
        dynamic result = await _auth.signIn(_email, _pass);
        print("email : $_email");
        print("pass : $_pass");
        if (result != null) {
          print("$result, Signed-in with email & password");
          print(result.userId);
        } else {
          print("Error signing in");
        }
      },
      child: const Text(
        "Sign-in",
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  ElevatedButton _signInAnonButton() {
    return ElevatedButton(
      style:
      ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white)),
      onPressed: () async {
        dynamic result = await _auth.signInAnon();
        if (result != null) {
          print("$result, Signed-in anonymously");
          print(result.userId);
        } else {
          print("Error signing in");
        }
      },
      child: const Text(
        "Sign-in anonymously",
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
