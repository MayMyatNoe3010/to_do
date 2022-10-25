class ToDoResponse{
  List<ToDo> todoList = [];
  ToDoResponse.fromJson(List<dynamic> json){
    for (var element in json) {json.add(ToDo.fromJson(element));}
  }
}
class ToDo{
  late String task;
  String? note;
  String? time;
  late bool isComplete;

  ToDo({required this.task, this.note, this.time, required this.isComplete});

  Map<String, dynamic> toJson(){
    final Map<String,dynamic> data = <String,dynamic>{};
    data['task'] = task;
    data['note'] = note;
    data['time'] = time;
    data['is_complete'] = isComplete;
    return data;
  }

  ToDo.fromJson(Map<String, dynamic>json){

    task = json['task'];
    note = json['note'];
    time = json['time'];
    isComplete = json['is_complete'];
  }
}