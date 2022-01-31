import 'package:flutter/material.dart';
import 'package:studentcommunications/pages/messages_page.dart';
import 'package:studentcommunications/pages/students_page.dart';
import 'package:studentcommunications/pages/teachers_page.dart';
import 'package:studentcommunications/repository/messages_repository.dart';
import 'package:studentcommunications/repository/students_repository.dart';
import 'package:studentcommunications/repository/teachers_repository.dart';

void main() {
  runApp(const StudentApp());
}

class StudentApp extends StatelessWidget {
  const StudentApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Application',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(title: 'Home Page'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MessagesRepository messagesRepository = MessagesRepository();
  StudentsRepository studentsRepository = StudentsRepository();
  TeachersRepository teachersRepository = TeachersRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  _goStudents(context);
                },
                child: Text("${studentsRepository.students.length} students")),
            ElevatedButton(
                onPressed: () {
                  _goMessages(context);
                },
                child:  Text(" ${messagesRepository.newMessageNumber} new messages")),
            ElevatedButton(
                onPressed: () {
                  _goTeachers(context);
                },
                child:  Text("${teachersRepository.teacher.length} teachers ")),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text("Student name"),
            ),
            ListTile(
              title: const Text("Students"),
              onTap: () {
                _goStudents(context);
              },
            ),
            ListTile(
              title: const Text("Teachers"),
              onTap: () {
                _goTeachers(context);
              },
            ),
            ListTile(
              title: const Text("Messages"),
              onTap: () {
                _goMessages(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _goMessages(BuildContext context) async{
   await Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return MessagesPage(messagesRepository);
    }));
   setState(() {

   });
  }

  void _goTeachers(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return TeachersPage(teachersRepository);
    }));
  }

  void _goStudents(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return StudentsPage(studentsRepository);
    }));
  }

}

