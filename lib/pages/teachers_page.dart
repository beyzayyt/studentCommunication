import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:studentcommunications/repository/teachers_repository.dart';

class TeachersPage extends StatefulWidget {
  final TeachersRepository teachersRepository;
  const TeachersPage(this.teachersRepository, {Key? key}) : super(key: key);

  @override
  State<TeachersPage> createState() => _TeachersPageState();
}

class _TeachersPageState extends State<TeachersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Students")),
      body: Column(
        children: [
          const PhysicalModel(
            color : Colors.white,
            elevation: 10,
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 32.0, horizontal: 32.0),
                child: Text("10 teachers"),
              ),
            ),
          ),
          Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) => ListTile(
                    leading: const Text(""),
                    trailing: IconButton(onPressed: () {

                    }, icon: Icon(Icons.favorite_border)),
                    title: Text("Levent"),
                  ),
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: 25
              )),
        ],
      ),
    );
  }
}
