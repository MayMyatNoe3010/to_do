import 'dart:convert';
import 'dart:developer';

import 'package:to_do/domain/model/to_do.dart';
import 'package:to_do/domain/network/api_handler.dart';
import 'package:to_do/domain/network/api_response.dart';

class APIService{
  static String urlString = 'https://todoflutter-67d91-default-rtdb.firebaseio.com/data.json';
  static Uri url = Uri.parse(urlString);
  static Future<APIResponse?> getTodoList(){

    return APIHandler.handleThisGet(url,  30, (Map<String, dynamic> json){
      print('object--->'+json.toString());
      return ToDoResponse.fromJson(json);
    });
  }

  static Future<APIResponse?> addToDo(ToDo toDo) {

    log('AddtoDo url',name: '$url -> ${toDo.toJson()}');
    return APIHandler.handleThisPost(
        url, jsonEncode(toDo.toJson()), 30, (dynamic json) {
          log('Post', name: json.toString());
    });
  }

  static Future<APIResponse?> editToDo(ToDo toDo){
    return APIHandler.handleThisPatch(url, jsonEncode({
      toDo.todoKey: toDo.toJson()
    }), 30, (dynamic json){
      log('Patch', name: json.toString());
    });
  }

  static Future<APIResponse?> deleteToDo(String key){
    return APIHandler.handleThisDelete(Uri.parse('https://todoflutter-67d91-default-rtdb.firebaseio.com/data/$key.json'), 30, (dynamic json){
      log('Delete', name: json.toString());
    });
  }
}