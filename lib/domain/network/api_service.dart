import 'dart:convert';
import 'dart:developer';

import 'package:to_do/domain/model/to_do.dart';
import 'package:to_do/domain/network/api_handler.dart';
import 'package:to_do/domain/network/api_response.dart';

class APIService{
  static String urlString = 'https://todoflutter-67d91-default-rtdb.firebaseio.com/data.json';
  static Future<APIResponse?> getTodoList(){
    Uri url = Uri.parse(urlString);
    return APIHandler.handleThisGet(url,  30, (Map<String, dynamic> json){
      log('ToDoList', name: '${ToDoResponse.fromJson(json).todoList}');
      return ToDoResponse.fromJson(json);
    });
  }

  static Future<APIResponse?> addToDo(ToDo toDo) {
    Uri url = Uri.parse(urlString);
    log('AddtoDo url',name: '$url -> ${toDo.toJson()}');
    return APIHandler.handleThisPost(
        url, jsonEncode(toDo.toJson()), 30, (dynamic json) {
          log('Post', name: json.toString());
    });
  }
}