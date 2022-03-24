import 'package:flutter/material.dart';
import '/constants/default_theme.dart';

class Attendance extends StatefulWidget {
  const Attendance({Key? key}) : super(key: key);

  @override
  _AttendanceState createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child:
                          const Icon(Icons.arrow_back, color: kText, size: 30)),
                  const Icon(Icons.notifications, color: kText, size: 30),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(20)),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                          color: Colors.grey[700], shape: BoxShape.circle),
                      child: const Icon(Icons.person,
                          color: Colors.white, size: 40),
                    ),
                    const SizedBox(width: 25),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Prathamesh Chavan",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(height: 20),
                        Text("Standard : CSE 2nd yr\nDiv : A",
                            style: TextStyle(
                              color: Colors.grey[800],
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            )),
                      ],
                    )
                  ]),
            ),
            Expanded(
              child: ListView(children: <Widget>[
                const Padding(
                  padding:  EdgeInsets.all(18.0),
                  child: Text(
                    'Attendance',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 30),
                DataTable(
                  columns: const [
                    DataColumn(
                        label: Text('Sr no',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('Subject',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('Attendance %',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold))),
                  ],
                  rows: const [
                    DataRow(cells: [
                      DataCell(Text('1',style: TextStyle(fontSize: 18),)),
                      DataCell(Text('DSA',style: TextStyle(fontSize: 18))),
                      DataCell(Text('91%',style: TextStyle(fontSize: 18))),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('2',style: TextStyle(fontSize: 18))),
                      DataCell(Text('OS',style: TextStyle(fontSize: 18))),
                      DataCell(Text('88%',style: TextStyle(fontSize: 18))),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('3',style: TextStyle(fontSize: 18))),
                      DataCell(Text('Java',style: TextStyle(fontSize: 18))),
                      DataCell(Text('72%',style: TextStyle(fontSize: 18))),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('4',style: TextStyle(fontSize: 18))),
                      DataCell(Text('Python',style: TextStyle(fontSize: 18))),
                      DataCell(Text('66%',style: TextStyle(fontSize: 18))),
                    ]),
                  ],
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
