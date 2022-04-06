import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:task_manager_application/pages/profile_page.dart';
import 'package:task_manager_application/provider/todos_provider.dart';

import 'add_todo.dart';
import 'calendar_page.dart';
import 'dashboard_page.dart';
import 'home_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //Variables
  int currentTab = 0;
  var pageList = [
    const HomePage(),
    const CalendarPage(),
    const AddTodo(),
    const DashboardPage(),
    const ProfilePage()
  ];

  @override
  void initState() {
    super.initState();
    Provider.of<TodosProvider>(context, listen: false).initSharedPreferences();
  }

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const HomePage();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        backgroundColor: HexColor('#d8dccd'),
        body: PageStorage(
          child: currentScreen,
          bucket: bucket,
        ),
        floatingActionButton: SizedBox(
          height: 50,
          child: FloatingActionButton(
            backgroundColor: HexColor('#1b2d48'),
            child: const Icon(Icons.add, color: Color.fromARGB(255, 247, 251, 255)),
            onPressed: () {
              setState(() {
                showCupertinoModalBottomSheet(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                  context: context,
                  builder: (context) => SizedBox(
                      height:
                          MediaQuery.of(context).size.height * 0.7, // 0.5 = 50% height of the screen
                      child: const AddTodo()),
                );
                currentTab = 5;
              });
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          child: SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = const HomePage();
                          currentTab = 0;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(
                            // ignore: deprecated_member_use
                            FontAwesomeIcons.home,
                            color: currentTab == 0 ? Color.fromARGB(255, 46, 63, 80) : Color.fromARGB(255, 190, 207, 218),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: MaterialButton(
                        minWidth: 40,
                        onPressed: () {
                          setState(() {
                            currentScreen = const CalendarPage();
                            currentTab = 1;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.calendar,
                              color:
                                  currentTab == 1 ? Color.fromARGB(255, 46, 63, 80) : Color.fromARGB(255, 190, 207, 218),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                // Right Tab Icons
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = const DashboardPage();
                          currentTab = 3;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.clipboardCheck,
                            color: currentTab == 3 ? Color.fromARGB(255, 46, 63, 80) : Color.fromARGB(255, 190, 207, 218),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: MaterialButton(
                        minWidth: 40,
                        onPressed: () {
                          setState(() {
                            currentScreen = const ProfilePage();
                            currentTab = 4;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.user,
                              color:
                                  currentTab == 4 ? Color.fromARGB(255, 46, 63, 80) : Color.fromARGB(255, 190, 207, 218),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
