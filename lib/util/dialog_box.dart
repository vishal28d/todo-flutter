// ignore_for_file: unused_label, sized_box_for_whitespace

import 'package:flutter/material.dart';

import 'my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;


   DialogBox({super.key, this.controller, required this.onCancel, required this.onSave});


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[400] ,
    content: Container(
      height: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
        // get user input
       // ignore: prefer_const_constructors
       TextField(
        controller: controller,
        decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        hintText: "Add a new Task",
        ),
       ),


        // button -> sove
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // save button 
            MyButton(text:"Save", onPressed: onSave),

            // cancel button
            MyButton(text:"Cancel", onPressed: onCancel)

          ],
        )


      ]),
      ) 
      );
  }
}