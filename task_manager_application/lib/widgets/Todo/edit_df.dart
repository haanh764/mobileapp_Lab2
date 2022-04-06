// ignore_for_file: unnecessary_new
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EditDF extends StatelessWidget {
  EditDF(
      {Key? key,
      required this.hint,
      required this.controller,
      required this.labelText})
      : super(key: key);

  String labelText;
  String hint;
  TextEditingController controller;
  var items = [
    {'title': 'Work', 'icon': const Icon(Icons.work)},
    {'title': 'Study', 'icon': const Icon(Icons.school)},
    {'title': 'Meeting', 'icon': const Icon(Icons.people)},
    {'title': 'Call', 'icon': const Icon(Icons.call)},
    {'title': 'Life', 'icon': const Icon(Icons.coffee)}
];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 15.0),
      child: new Row(
        children: [
          new Expanded(child: new TextFormField(controller: controller,
            decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10.0),
            ),
            fillColor: const Color.fromARGB(255, 222, 233, 240),
            filled: true,
            suffixIcon: IconButton(
              icon: const Icon(
                Icons.clear_outlined,
                size: 20,
                color: Color.fromARGB(255, 65, 127, 197),
              ),
              onPressed: () {
                controller.text = '';
              },
            ),
            hintText: labelText,
            hintStyle: const TextStyle(color: Colors.black)),
          ),),
          new PopupMenuButton(
            icon: const Icon(Icons.arrow_drop_down),
            onSelected: (String value) {
              controller.text = value;
            },
            itemBuilder: (BuildContext context) {
              return items.map((choice) {
                return PopupMenuItem<String>(
                  value: choice['title'].toString(),
                  child: ListTile(
                    leading: choice['icon'] as Widget, // your icon
                    title: Text(choice['title'].toString()),
                  ),
                );
              }).toList();
            },
          )
        ],
      )
    );
  }
}
