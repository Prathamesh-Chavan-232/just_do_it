import '/screens/calendar/calendar.dart';
import 'package:flutter/material.dart';
import '/constants/default_theme.dart';

class Menu extends StatefulWidget {
  final BuildContext context;
  final Widget logout;
  const Menu({required this.context, required this.logout, Key? key})
      : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    var menuList = [
      const Text(
        "Attendance",
        style: TextStyle(color: kText, fontSize: 18),
      ),
      const Text(
        "Courses",
        style: TextStyle(color: kText, fontSize: 18),
      ),
      InkWell(
        onTap: () {
          Navigator.push((context),
              MaterialPageRoute(builder: (context) => const Calendar()));
        },
        child: const Text(
          "Calendar",
          style: TextStyle(color: kText, fontSize: 18),
        ),
      ),
      const Text(
        "Settings",
        style: TextStyle(color: kText, fontSize: 18),
      ),
    ];

    return Material(
      color: kBgClrLight,
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) => menuList[index],
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 15),
                      itemCount: 4)),
              const Spacer(),
              widget.logout,
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
