import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/provider/todos_provider.dart';

class TaskInfo extends StatefulWidget {
  const TaskInfo({Key? key}) : super(key: key);

  @override
  _Task_InfoState createState() => _Task_InfoState();
}

// ignore: camel_case_types
class _Task_InfoState extends State<TaskInfo> {
  @override
  Widget build(BuildContext context) {
    List monthsNames = [
      '0 index data',
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 20, top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Your upcoming tasks',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Consumer<TodosProvider>(
                      builder: (context, state, child) => Text(
                        'You have ${state.unCompletedTodos.where((Todo) => DateTime.fromMillisecondsSinceEpoch(Todo.dateMilliseconds).day == DateTime.now().day).length} tasks for ${DateTime.now().day.toString().padLeft(2, '0')} ${monthsNames[DateTime.now().month]}',
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 121, 121, 121)),
                      ),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
