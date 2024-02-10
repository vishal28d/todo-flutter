// ignore_for_file: must_be_immutable, sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  TodoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction
  });

  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction, 
              icon: Icons.delete,
              backgroundColor: Color.fromARGB(255, 238, 32, 32) ,
              borderRadius: BorderRadius.circular(12),
              ),
          ],

        ),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              // checkbox
              Checkbox(value: taskCompleted, onChanged: onChanged),
              // task name
              Text(
                taskName,
                style: TextStyle(
                  fontSize: 20,
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.blue[200],
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
