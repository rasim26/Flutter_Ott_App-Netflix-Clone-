import 'package:database_app/db/functions/db_functions.dart';
import 'package:database_app/widgets/add_student_widget.dart';
import 'package:database_app/widgets/list_student_widget.dart';
import 'package:flutter/material.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    getAllStudents();
    return Scaffold(
      backgroundColor: Color.fromRGBO(212, 240, 231, 1),
      body: SafeArea(
          child: Column(
        children: [
          AddStudentWidget(),
          const Expanded(child: ListStudentWidget()),
        ],
      )),
    );
  }
}
