import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTF extends StatelessWidget {
  CustomTF(
      {Key? key,
      required this.hint,
      required this.controller,
      required this.labelText})
      : super(key: key);

  String labelText;
  String hint;
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 15.0),
      child: TextFormField(
        textInputAction:
            labelText.contains('Description') || labelText.contains('Title')
                ? TextInputAction.next
                : TextInputAction.done,
        maxLength: labelText.contains('Title')
            ? 15
            : 250,
        maxLines: labelText.contains('Description') ? null : 1,
        controller: controller,
        validator: (value) {
          if (labelText.contains('Title')) {
            if (value!.isEmpty) {
              return 'Please enter $labelText';
            }
          }
        },
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
      ),
    );
  }
}
