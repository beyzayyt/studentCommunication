import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:studentcommunications/repository/students_repository.dart';

class StudentsPage extends StatefulWidget {
  final StudentsRepository studentsRepository;

  const StudentsPage(this.studentsRepository, {Key? key}) : super(key: key);

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
          PhysicalModel(
            color: Colors.white,
            elevation: 10,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 32.0, horizontal: 32.0),
                child: Text(
                    "${widget.studentsRepository.students.length} students"),
              ),
            ),
          ),
          Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) => StudentRow(
                        widget.studentsRepository.students[index], widget.studentsRepository
                      ),
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: widget.studentsRepository.students.length)),
        ],
      ),
    );
  }
}

class StudentRow extends StatefulWidget {
  final Student student;
  final StudentsRepository studentsRepository;

  const StudentRow(
    this.student,
    this.studentsRepository, {
    Key? key,
  }) : super(key: key);

  @override
  State<StudentRow> createState() => _StudentRowState();
}

class _StudentRowState extends State<StudentRow> {
  @override
  Widget build(BuildContext context) {
    bool amILove = widget.studentsRepository.amIlove(widget.student);
    return ListTile(
      leading: IntrinsicWidth(child: Center(child: Text(widget.student.sex))),
      title: Text(widget.student.name + " " + widget.student.surname + " "),
      trailing: IconButton(
        onPressed: () {
          setState(() {
            widget.studentsRepository.love(widget.student, !amILove);
          });
        },
        icon: Icon( amILove
            ? Icons.favorite
            : Icons.favorite_border),
      ),
    );
  }
}
