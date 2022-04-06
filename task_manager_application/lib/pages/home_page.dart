import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:task_manager_application/widgets/HomePage/Grettings/greetings.dart';
import 'package:task_manager_application/widgets/HomePage/Tasks/task_info.dart';
import 'package:task_manager_application/widgets/Todo/todo_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#d8dccd'),
      body: LayoutBuilder(builder: (context, constraints) {
        return Column(
          children: [
            constraints.maxWidth < 350
                ? Greetings(customFontSize: 25)
                : Greetings(
                    customFontSize: 30,
                  ),
            const TaskInfo(),
            const Expanded(child: TodoWidget())
          ],
        );
      }),
    );
  }
}
