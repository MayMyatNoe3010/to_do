import 'dart:developer';

import 'package:flutter/material.dart';

import '../../domain/model/to_do.dart';
import '../../res/styles.dart';

class HomeListViewWidget extends StatelessWidget {
  List<ToDo> todoList;
  HomeListViewWidget({
    Key? key,
    required this.todoList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log('ToDoLength',name: todoList.length.toString());
    return ListView.builder(
        shrinkWrap: true,
        itemCount: todoList.length,
        itemBuilder: (BuildContext context, int index) {
          ToDo todo = todoList[index];
          return Card(
            child: ListTile(
              leading: (todo.isComplete)
                  ? Icon(Icons.check_circle_outline, color: Colors.blue,)
                  : Icon(Icons.circle_outlined),
              title:
                  Text(todo.task,style: Styles.getStringDeco(todo.isComplete), ),

              
            ),
          );
        });
  }
}
