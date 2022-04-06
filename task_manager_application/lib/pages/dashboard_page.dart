import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:task_manager_application/widgets/Dashboard/complete_todo_list.dart';
import 'package:task_manager_application/widgets/Dashboard/completed_task_info.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: dashboardAB(),
      body: Container(
        color: HexColor('#d8dccd'),
        child: Column(
          children: const [
            CompletedTaskInfo(),
            CompleteTodoList()
          ],
        ),
      ),
    );
  }
}

AppBar dashboardAB() {
  return AppBar(
    centerTitle: true,
    backgroundColor: HexColor('#d8dccd'),
    elevation: 0,
  title: const Text('Dashboard',style: TextStyle(fontSize: 25,color: Colors.black),
  ),
  );
}
