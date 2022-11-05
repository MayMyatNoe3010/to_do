import 'package:to_do/domain/model/to_do.dart';

abstract class Home{
  getToDoList();
  addToDo(ToDo toDo);
  editToDo(ToDo toDo);
  deleteToDo(String key);
}