import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../models/todo.dart';

// ignore: must_be_immutable
class TodoInfoSection extends StatelessWidget {
  TodoInfoSection({Key? key, required this.todo}) : super(key: key);
  Todo todo;

  @override
  Widget build(BuildContext context) {
    DateTime todoDate =
        DateTime.fromMillisecondsSinceEpoch(todo.dateMilliseconds);
    DateTime todoTime =
        DateTime.fromMillisecondsSinceEpoch(todo.timeMilliseconds);
    return Container(
      color: Colors.transparent,
      child: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          categoryText(todo.category, context),
          SizedBox(
            height: 20.h,
          ),
          Text(
            todo.title,
            style: TextStyle(
                fontWeight: FontWeight.w700,
                color: HexColor('#393939'),
                fontSize: 24),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w, top: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_today,
                    ),
                    Text(
                      ' ${todoDate.day.toString().padLeft(2, '0')}/${todoDate.month.toString().padLeft(2, '0')}/${todoDate.year}',
                      style: TextStyle(
                        fontSize: 15,
                        color: HexColor('#393939'),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20.w),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.access_time_outlined,
                      ),
                      Text(
                        ' ${todoTime.hour.toString().padLeft(2, '0')}:${todoTime.minute.toString().padLeft(2, '0')}',
                        style: TextStyle(
                          fontSize: 15,
                          color: HexColor('#393939'),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
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

Widget categoryText(String categoryName, BuildContext context) {
  return Container(
    height: 25.h,
    width: 150.w,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(40.0),
      color: getColor(categoryName),
    ),
    child: Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              categoryName!='Uncategorized' ? getIcon(categoryName) : const Text(''),
              const Padding(padding: EdgeInsets.only(right: 5.0)),
              Text(
                categoryName,
                style: const TextStyle(
                  fontSize: 14,
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
