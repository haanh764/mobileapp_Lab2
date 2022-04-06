import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager_application/widgets/Todo/todo_card.dart';
import 'package:task_manager_application/provider/todos_provider.dart';

class TodoWidget extends StatefulWidget {
  const TodoWidget({Key? key}) : super(key: key);

  @override
  _TodoWidgetState createState() => _TodoWidgetState();
}

class _TodoWidgetState extends State<TodoWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TodosProvider>(
      builder: (context, state, child) => SizedBox(
        height: MediaQuery.of(context).size.height / 2.68,
        child: ListView.builder(
            itemCount: state.unCompletedTodos
                // ignore: non_constant_identifier_names
                .where((Todo) =>
                    DateTime.fromMillisecondsSinceEpoch(Todo.dateMilliseconds)
                        .day ==
                    DateTime.now().day)
                .length,
            itemBuilder: (context, index) {
              return TodoCard(
                todo: state.unCompletedTodos
                    // ignore: non_constant_identifier_names
                    .where((Todo) =>
                        DateTime.fromMillisecondsSinceEpoch(
                                Todo.dateMilliseconds)
                            .day ==
                        DateTime.now().day)
                    .toList()[index],
              );
            }),
      ),
    );
  }
}
