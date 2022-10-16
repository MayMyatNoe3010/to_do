import 'package:flutter/material.dart';

import '../../domain/model/to_do.dart';

class HomeListViewWidget extends StatelessWidget {
  List<ToDo> todoList;
  HomeListViewWidget({
    Key? key,
    required this.todoList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
          ListView.builder(
              itemCount: todoList.length,
              itemBuilder: (BuildContext context,int index){
                ToDo todo = todoList[index];
                return ListTile(
                  leading: (todo.isComplete)? Icon(Icons.check_circle_outline): Icon(Icons.circle_outlined),
                  title: Column(
                    children: [
                      Text(todo.task),
                      Text(todo.time as String),
                    ],
                  ),
                );
              })

    ;
  }
}