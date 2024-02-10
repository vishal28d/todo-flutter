// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_application_4/data/database.dart';
import 'package:flutter_application_4/util/todo_tile.dart';
import 'package:hive_flutter/hive_flutter.dart';
// import 'database.dart';

import '../util/dialog_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
      // reference the hive box 
      final _myBox = Hive.box('myBox') ;
      ToDoDatabase db = ToDoDatabase() ;

@override
  void initState() {
    // first time ever oppening app
    if(_myBox.get("TODOLIST") == null ) {
      db.createInitialData() ;
    } else{ 
        db.loadData() ;
    }

    super.initState();
  }


    // text controller
    final _controller = TextEditingController();

  void checkBoxChanged(bool value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDatabase() ;
  }

  // save new task
  void saveNewTask(){
    setState(() {
      db.toDoList.add([_controller.text, false]) ;
      _controller.clear();
    });
    Navigator.of(context).pop() ;
    db.updateDatabase() ;
  }


  // create new task
  void createNewTask(){
    showDialog(
      context: context, 
      builder: (context){
        return DialogBox(
          controller: _controller ,
          onSave: saveNewTask ,
          onCancel: ()=> Navigator.of(context).pop() ,
        );
      },
      );
      db.updateDatabase() ;
  }

    // delete task
    void deleteTask(int index){
      setState(() {
        
        db.toDoList.removeAt(index) ;
      });
      db.updateDatabase() ;
    
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Center(child: Text("TO DO")),
        elevation: 1,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),

      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
            onChanged: (value) {
              checkBoxChanged(value!, index);
            },
            deleteFunction: (context) => deleteTask(index) ,
          );
        },
      ),
    );
  }
}
