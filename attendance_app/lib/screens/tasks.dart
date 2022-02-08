import 'package:flutter/material.dart';

class Tasks extends StatefulWidget {
  const Tasks({Key? key}) : super(key: key);

  @override
  _TasksState createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  Color? Red_ = Colors.red.shade300;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(backgroundColor: Red_),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.notifications_none,size: 35,))
                ],
              ),

              const Padding(
                padding: EdgeInsets.only(top: 18.0),
                child: TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.search, size: 18),
                      hintStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                      hintText: "Search anything",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)))),
                ),
              ),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Tasks',
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          overlayColor:
                          MaterialStateProperty.all(Colors.transparent)),
                      child: const Text('SEE ALL',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold)))
                ],
              ),
              for (int i = 0; i < 7; ++i)
                Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 4.0),
                  child: SizedBox(
                    height: 50,
                    child: ListTile(
                      onTap: () {},
                      leading: const SizedBox(
                        height: 30,
                        child: Text('Lab Assignment 6',
                            style: TextStyle(fontSize: 16)),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        side: const BorderSide(color: Colors.grey, width: 2),
                      ),
                    ),
                  ),
                ),

            ],
          ),
        ),
      ),
    );
  }
}
