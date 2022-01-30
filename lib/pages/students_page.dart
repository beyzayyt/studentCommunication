import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:studentcommunications/repository/students_repository.dart';

class StudentsPage extends StatefulWidget {
  final StudentsRepository studentsRepository;
  const StudentsPage(this.studentsRepository, {Key? key})
      : super(key: key);

  @override
  State<StudentsPage> createState() => _StudentsPageState();
}

class _StudentsPageState extends State<StudentsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Students")),
      body: Column(
        children: [
          const PhysicalModel(
            color: Colors.white,
            elevation: 10,
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 32.0, horizontal: 32.0),
                child: Text("10 students"),
              ),
            ),
          ),
          Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) => const ListTile(
                        leading: Text("Boy or Girl"),
                        title: Text("Beyza"),
                      ),
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: 25)),
        ],
      ),
    );
  }
}
