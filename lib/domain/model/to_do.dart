import 'dart:developer';

class ToDoResponse{

  List<ToDo> todoList = [];
  ToDoResponse.fromJson(Map<String, dynamic> json){
    //for (var element in json) {todoList.add(ToDo.fromJson(element));}
    if(json != null){



      json.forEach((key, value) {

        todoList.add(ToDo.fromJson(key,value));
      });
      log('Todo Length', name: '${todoList.first.todoKey} -> ${todoList.first.id}');

    }


  }
}
class ToDo{
  late int id;
  late String task;
  String? note;
  String? time;
  late bool isComplete;
  String? date;
  String? todoKey;

  ToDo({required this.task, this.note, this.time,required this.isComplete, this.date});

  Map<String, dynamic> toJson(){
    final Map<String,dynamic> data = <String,dynamic>{};

    data['id'] = id;
    data['task'] = task;
    data['note'] = note;
    data['time'] = time;
    data['is_complete'] = isComplete;
    data['date'] = date;
    return data;
  }

  ToDo.fromJson(String key,Map<String, dynamic>json){
    log('FromJson', name: key);
    id = json['id'];
    task = json['task'];
    note = json['note'];
    time = json['time'];
    isComplete = json['is_complete'];
    date = json['date'];
    todoKey  = key;
  }
}