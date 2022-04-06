import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:task_manager_application/models/todo.dart';
import 'package:task_manager_application/widgets/DetailPage/todo_description.dart';

import '../widgets/DetailPage/todo_info_section.dart';
import 'edit_todo.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.todo}) : super(key: key);
  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => LayoutBuilder(
        builder: (context, constraints) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                showCupertinoModalBottomSheet(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  context: context,
                  builder: (context) => SizedBox(
                    height:
                      MediaQuery.of(context).size.height / 1.2,
                        // // for iphone 11
                        // constraints.maxHeight == 896 ||
                        //         constraints.maxHeight == 926
                        //     ? MediaQuery.of(context).size.height / 1.6
                        //     :
                        //     // For iphone 11 pro, 12 mini, 12 pro(height 771)
                        //     constraints.maxHeight == 812 ||
                        //             constraints.maxHeight == 771
                        //         ? MediaQuery.of(context).size.height / 1.5
                        //         : //For iphone 5s
                        //         constraints.maxHeight == 522
                        //             ? MediaQuery.of(context).size.height / 1
                        //             : MediaQuery.of(context).size.height / 1.2,
                    child: EditTodo(
                      todo: todo,
                    ),
                  ),
                );
              },
              child: SvgPicture.asset(
                'lib/img/editicon.svg',
                width: 26.w,
              ),
              backgroundColor: Color.fromARGB(255, 98, 132, 156),
            ),
            backgroundColor: HexColor('#d8dccd'),
            body: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: TodoInfoSection(
                    todo: todo,
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: TodoDescription(
                      todo: todo,
                      textFontSize: 16.h,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
