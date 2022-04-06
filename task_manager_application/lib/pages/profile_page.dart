import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../widgets/Profile/todos_stats_comp.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(391, 850),
      builder: () => LayoutBuilder(builder: (context, constraints) {
        return Scaffold(
          backgroundColor: HexColor('#d8dccd'),
          // App Bar
          appBar: AppBar(
            backgroundColor: HexColor('#d8dccd'),
            title: const Text(
              'Profile',
              style: TextStyle(color: Colors.black),
            ),
            elevation: 0,
          ),
          body: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: HexColor('#d8dccd'),
                    ),
                  ),
                  // White Container
                  Expanded(
                    flex:
                        constraints.maxHeight == 633.4285714285714 ? 5 : 7,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30.0),
                          topLeft: Radius.circular(30.0),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: constraints.maxHeight == 617 ||
                                    constraints.maxHeight == 518
                                ? 120.h
                                : 100.h),
                        child: const TodosStats(),
                      ),
                    ),
                  )
                ],
              ),

              // Profile Avatar
              Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: constraints.maxHeight == 617 ? 25.w : 40.w,
                      child: Row(
                        children: const [
                          CircleAvatar(
                            backgroundImage:
                            AssetImage('./lib/img/ava.png'),
                            radius: 60,
                            backgroundColor: Color.fromARGB(255, 190, 193, 196),
                          ),]
                        )
                    )
                ],
              )
            ],
          ),
        );
      }),
    );
  }
}
