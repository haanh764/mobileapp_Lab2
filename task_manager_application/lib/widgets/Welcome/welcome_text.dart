import 'package:flutter/material.dart';

// ignore: camel_case_types
class welcomeText extends StatelessWidget {
  const welcomeText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 10.0, left: 10, right: 10),
              child: Text(
                'Welcome to Task Manager',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Image.asset(
                './lib/img/logo.png',
                width: 170,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10.0, left: 15, right: 15),
              child: Text(
                'How can I call you?',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ));
  }
}
