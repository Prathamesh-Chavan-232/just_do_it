import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '/constants/default_theme.dart';
import '/services/auth_service.dart';
import '/services/database.dart';
import '/screens/home_screen/addTask.dart';
import 'home_page.dart';
import 'menu.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  late bool isCollapsed;
  late double screenHeight, screenWidth;
  Duration duration =
      const Duration(milliseconds: 200); // parameters for animated positioned

  late AnimationController _controller; // Animation controller
  late Animation<double> _scaleAnimation; // scale down animation for home page
  late Animation<double> _menuscaleAnimation; // Scale animation for menu
  late Animation<Offset> _slideAnimation; // Slide transition for menu

  final AuthService _auth =
      AuthService(); // getting login data from firebase auth

  @override
  void initState() {
    isCollapsed = false;
    _controller = AnimationController(vsync: this, duration: duration);

    _scaleAnimation = Tween<double>(begin: 1, end: 0.8)
        .animate(_controller); // scale everything from 100% to 80%

    _menuscaleAnimation = Tween<double>(begin: 0, end: 1).animate(
        _controller); // scale the menu so it appears like a pop out animation

    _slideAnimation =
        Tween<Offset>(begin: const Offset(-1, 0), end: const Offset(0, 0))
            .animate(_controller);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    screenHeight = screenSize.height;
    screenWidth = screenSize.width;

    return Scaffold(
      body: Stack(
        children: [
          menu(context),
          dashboard(context),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const AddTask()));
        },
        backgroundColor: kButtonClr,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget menu(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
          scale: _menuscaleAnimation,
          child: Menu(context: context, logout: _signoutButton())),
    );
  }

  Widget dashboard(BuildContext context) {
    return AnimatedPositioned(
      duration: duration,
      top: 0,
      bottom: 0,
      left: isCollapsed ? 0.6 * screenWidth : 0,
      right: isCollapsed ? -0.4 * screenWidth : 0,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
          elevation: 8,
          color: kBgClrLight,
          borderRadius: isCollapsed
              ? const BorderRadius.all(Radius.circular(40))
              : BorderRadius.zero,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildAppBar(),
                  const Expanded(child: HomePage()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          _menuButton(),
          Row(children: [_searchButton(), _bellButton()])
        ],
      );

  IconButton _menuButton() => IconButton(
      onPressed: () {
        setState(() {
          isCollapsed ? _controller.reverse() : _controller.forward();
          isCollapsed = !isCollapsed;
        });
      },
      icon: const Icon(Icons.dehaze, color: kText, size: 30));

  IconButton _searchButton() => IconButton(
        onPressed: () {},
        icon: const Icon(Icons.search, color: kText, size: 30),
      );

  IconButton _bellButton() => IconButton(
        onPressed: () {},
        icon: const Icon(Icons.notifications, color: kText, size: 30),
      );

  Widget _signoutButton() {
    return InkWell(
      onTap: () async {
        await _auth.signOut();
      },
      child: const Text(
        "Sign out",
        style: TextStyle(color: kText, fontSize: 18),
      ),
    );
  }
}
