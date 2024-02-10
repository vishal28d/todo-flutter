
import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase{

  // lit
  List toDoList = [] ;

  // reference the box
  final _myBox = Hive.box('myBox') ;

  // first time open app
  void createInitialData(){
      toDoList = [
        ["Add a task...", false]
      ] ;
  }

  void loadData(){
    toDoList = _myBox.get("TODOLIST")  ;
  }

  // todo list update
  void updateDatabase(){
    _myBox.put("TODOLIST", toDoList);
  }

}