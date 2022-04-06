import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:task_manager_application/pages/main_screen.dart';
import 'package:task_manager_application/pages/welcome_screen.dart';
import 'package:task_manager_application/provider/todos_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  TodosProvider().initSharedPreferences();
  var userName = await TodosProvider().readName('userName');
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(
    ChangeNotifierProvider<TodosProvider>(
      create: (BuildContext context) => TodosProvider(),
      child: MyApp(
        userName: userName.toString(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.userName}) : super(key: key);
  // ignore: prefer_typing_uninitialized_variables
  final userName;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: HexColor('#f9f6e8'),
      ),
      localizationsDelegates: const [
        DefaultCupertinoLocalizations.delegate,
      ],
      home: userName.toString().contains('null')
          ? const WelcomeScreen()
          : const MainScreen(),
    );
  }
}
