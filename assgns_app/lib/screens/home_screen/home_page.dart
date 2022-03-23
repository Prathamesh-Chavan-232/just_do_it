import 'package:flutter/material.dart';
import '/constants/constants.dart';

Color changeColor(int i) {
  return i == 1 ? Colors.deepPurple : Colors.green;
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgClrLight,
      appBar: AppBar(
        backgroundColor: kBgClrLight,
        elevation: 0,
        leading: _menuButton(),
        actions: [_searchButton(), _bellButton()],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Hi, Prathamesh!",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, i) => _courseTile(),
                    separatorBuilder: (context, i) => const SizedBox(width: 20),
                    itemCount: 6),
              ),
              const SizedBox(height: 50),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, i) => _taskTile(),
                  separatorBuilder: (context, i) => const SizedBox(height: 20),
                  itemCount: 8,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _courseTile() {
    return Container(
      width: 250,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  Widget _taskTile() {
    return Container(
      child: const Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "     Assignment",
          style: TextStyle(fontSize: 20),
        ),
      ),
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }

  IconButton _searchButton() => IconButton(
    onPressed: () {},
    icon: const Icon(Icons.search, color: Colors.black26),
  );

  IconButton _bellButton() => IconButton(
    onPressed: () {},
    icon: const Icon(Icons.notifications, color: Colors.black26),
  );

  IconButton _menuButton() {
    return IconButton(
      onPressed: () {},
      icon: const Icon(Icons.dehaze, color: Colors.black26),
    );
  }
}
