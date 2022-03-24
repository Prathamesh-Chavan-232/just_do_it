import 'package:assgns_app/models/tasks.dart';
import 'package:flutter/material.dart';

import '/constants/default_theme.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:  const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.arrow_back,
                            color: kText, size: 30)),
                  ]),
              SizedBox(height: 60),
              TextFormField(
                onChanged: (val) {},
                decoration: const InputDecoration(
                    hintText: "Create a new Task",
                    border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 30),
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                  child: const Text("Create Task",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
                  decoration: BoxDecoration(
                    color: kButtonClr,
                    borderRadius: BorderRadius.circular(20),
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
