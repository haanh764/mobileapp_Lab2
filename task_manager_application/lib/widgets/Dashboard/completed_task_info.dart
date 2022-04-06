import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/provider/todos_provider.dart';
import 'clear_todos_btn.dart';

class CompletedTaskInfo extends StatefulWidget {
  const CompletedTaskInfo({Key? key}) : super(key: key);

  @override
  _Task_InfoState createState() => _Task_InfoState();
}

// ignore: camel_case_types
class _Task_InfoState extends State<CompletedTaskInfo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Text(
                      'Your completed tasks',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 50.0),
                      child: ClearTodosBtn(),
                    ),
                  ],
                ),
                Consumer<TodosProvider>(
                  builder: (context, state, child) => Text(
                    'You have ${state.completedTodos.length} completed tasks in total',
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 121, 121, 121)),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
