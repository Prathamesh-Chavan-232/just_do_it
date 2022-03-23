import '/screens/wrapper.dart';
import '/models/user.dart';
import '/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/screens/home_screen/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import '/screens/authenticate/authenticate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyUser?>.value(
      initialData: null,
      value: AuthService().userStream,
      child: MaterialApp(
        routes: {
          '/': (context) => const Wrapper(),
          '/home_page': (context) => const HomePage(),
          '/authenticate': (context) => const Auth(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
