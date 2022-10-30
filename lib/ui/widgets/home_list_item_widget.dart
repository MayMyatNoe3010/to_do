import 'dart:developer';

import 'package:flutter/material.dart';

import '../../domain/model/to_do.dart';
import '../../res/styles.dart';

class HomeListItemWidget extends StatelessWidget {
  ToDo todo;
  HomeListItemWidget({
    Key? key,
    required this.todo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Card(
      child: ListTile(
        leading: (todo.isComplete)
            ? Icon(Icons.check_circle_outline, color: Colors.blue,)
            : Icon(Icons.circle_outlined),
        title:
        Text(todo.task,style: Styles.getStringDeco(todo.isComplete), ),


      ),
    );

  }
}
