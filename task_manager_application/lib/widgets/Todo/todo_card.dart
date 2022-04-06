import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:task_manager_application/models/todo.dart';
import 'package:task_manager_application/pages/detail_screen.dart';
import '/provider/todos_provider.dart';

class TodoCard extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const TodoCard({required this.todo, String? key});

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    DateTime todoDate =
        DateTime.fromMillisecondsSinceEpoch(todo.dateMilliseconds);
    DateTime todoTime =
        DateTime.fromMillisecondsSinceEpoch(todo.timeMilliseconds);  
    return GestureDetector(
      onTap: () {
        Future(() {
          showBarModalBottomSheet(
              context: context,
              builder: (context) => DetailScreen(
                    todo: todo,
                  ));
        });
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Slidable(
          key: UniqueKey(),
          startActionPane: ActionPane(
            motion: const ScrollMotion(),
            dismissible: DismissiblePane(
              onDismissed: () {
                Provider.of<TodosProvider>(context, listen: false)
                    .toggleTodo(todo);
                Fluttertoast.showToast(
                    msg: "Done!",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Color.fromARGB(255, 45, 104, 46),
                    textColor: Colors.white,
                    fontSize: 16.0);
              },
            ),
            children: [
              SlidableAction(
                onPressed: (BuildContext context) {
                  Provider.of<TodosProvider>(context, listen: false)
                      .toggleTodo(todo);
                  Fluttertoast.showToast(
                      msg: "Done!",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Color.fromARGB(255, 45, 104, 46),
                      textColor: Colors.white,
                      fontSize: 16.0);
                },
                backgroundColor: Color.fromARGB(255, 45, 104, 46),
                label: 'Done!',
              )
            ],
          ),
          endActionPane: ActionPane(
            motion: const ScrollMotion(),
            dismissible: DismissiblePane(
              onDismissed: () {
                Provider.of<TodosProvider>(context, listen: false)
                    .removeTodo(todo);
                Fluttertoast.showToast(
                    msg: "Uncompleted!!",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Color.fromARGB(255, 158, 21, 11),
                    textColor: Colors.white,
                    fontSize: 16.0);
              },
            ),
            children: [
              SlidableAction(
                onPressed: (BuildContext context) {
                  Provider.of<TodosProvider>(context, listen: false)
                      .removeTodo(todo);
                  Fluttertoast.showToast(
                      msg: "Removed!",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Color.fromARGB(255, 158, 21, 11),
                      textColor: Colors.white,
                      fontSize: 16.0);
                },
                backgroundColor: Color.fromARGB(255, 158, 21, 11),
                label: 'Remove!',
              )
            ],
          ),
          child: Card(
            shadowColor: Colors.transparent,
            color: Colors.white,
            elevation: 20,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Padding(
                    padding: const EdgeInsets.all(36.0),
                    child: SizedBox(
                      child: Transform.scale(
                        scale: 1.4,
                        child: Checkbox(
                          shape: const CircleBorder(),
                          checkColor: Colors.white,
                          activeColor: Colors.black,
                          value: todo.complete,
                          onChanged: (bool? value) {
                            Provider.of<TodosProvider>(context, listen: false)
                                .toggleTodo(todo);
                            Fluttertoast.showToast(
                                msg: "Done!",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Color.fromARGB(255, 45, 104, 46),
                                textColor: Colors.white,
                                fontSize: 16.0);
                          },
                        ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      categoryText(todo.category),
                      titleText(todo.title),
                      dateTimeInfo(' ${todoDate.day.toString().padLeft(2, '0')}/${todoDate.month.toString().padLeft(2, '0')}/${todoDate.year} | ${todoTime.hour.toString().padLeft(2, '0')}:${todoTime.minute.toString().padLeft(2, '0')}'),
                    ],
                  )
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget categoryText(String categoryName) {
  return Container(
    height: 22,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.0),
      color: getColor(categoryName),
    ),
    child: Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Center(
          child: Row(
            children: [
              categoryName!='Uncategorized' ? getIcon(categoryName) : Text(''),
              const Padding(padding: EdgeInsets.only(right: 5.0)),
              Text(
                categoryName,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 61, 61, 61),
                ),
              ),
            ],
          )
      ),
    ),
  );
}

Color getColor(String categoryName) {
   if (categoryName == 'Work') {return HexColor('#8990B3');}
   else if (categoryName == 'Study') {return HexColor('#FFD3C4');}
   else if (categoryName == 'Meeting') {return HexColor('#DEE3FF');}
   else if (categoryName == 'Call') {return HexColor('#DEFFC4');}
   else if (categoryName == 'Life') {return HexColor('#A0B392');}
   else {return Colors.grey;}
}

Icon getIcon(String categoryName) {
   if (categoryName == 'Work') {return const Icon(Icons.work, size: 16.0, color: Color.fromARGB(255, 61, 61, 61),);}
   else if (categoryName == 'Study') {return const Icon(Icons.school, size: 16.0, color: Color.fromARGB(255, 61, 61, 61));}
   else if (categoryName == 'Meeting') {return const Icon(Icons.people, size: 16.0, color: Color.fromARGB(255, 61, 61, 61));}
   else if (categoryName == 'Call') {return const Icon(Icons.call, size: 16.0, color: Color.fromARGB(255, 61, 61, 61));}
   else if (categoryName == 'Life') {return const Icon(Icons.coffee, size: 16.0, color: Color.fromARGB(255, 61, 61, 61));}
   else {return const Icon(Icons.face);}
}

Widget titleText(String titleName) {
  return Padding(
    padding: const EdgeInsets.only(top: 10.0),
    child: Center(
        child: Text(
      titleName,
      maxLines: 2,
      overflow: TextOverflow.fade,
      style: const TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
    )),
  );
}

Widget dateTimeInfo(String dateTime) {
  return Padding(
    padding: const EdgeInsets.only(top: 10.0),
    child: Center(
          child: Row(
            children: [
              const Icon(Icons.calendar_today, size: 16.0, color: Color.fromARGB(255, 49, 49, 49),),
              const Padding(padding: EdgeInsets.only(right: 5.0)),
              Text(
                dateTime,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 22, 22, 22),
                ),
              ),
            ],
          )
    ),
  );
}
