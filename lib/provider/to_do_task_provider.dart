import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:to_do/domain/model/to_do.dart';
import 'package:to_do/domain/network/api_response.dart';
import 'package:to_do/domain/network/api_service.dart';
import 'package:to_do/main.dart';
import 'package:to_do/provider/base/api_state_wrapper.dart';
import 'package:to_do/provider/base/base_presenter.dart';

import '../domain/use_case/home_use_case.dart';
import '../utils/utils.dart';

class ToDoTaskProvider extends BasePresenter implements Home{
  APIStateWrapper todoAPIState = APIStateWrapper(apiState: APIState.idle, data:  null, message: '');
  APIStateWrapper addToDoAPIState = APIStateWrapper(apiState: APIState.idle, data: null, message: '');
  int currentId = 0;
  bool isFirstCall = true;
  @override
  deliverProvider() {
    return super.makeProvider(this);
  }

  @override
  addToDo(ToDo toDo) async{
    isFirstCall = false;
    addToDoAPIState.apiState = APIState.loading;
    addToDoAPIState.message  = 'Loading';
    notifyListeners();
    toDo.id = increaseId();
    toDo.date = DateTime.now().toString();
    log('ToDoID', name: toDo.id.toString());
    var value = await APIService.addToDo(toDo);
    if(value is Success){
      log('ValueAdd', name: value.response.toString());


      addToDoAPIState.apiState = APIState.success;
      addToDoAPIState.message = 'Success';
    }else{
      addToDoAPIState.apiState = APIState.error;
      addToDoAPIState.message = 'Error';
    }

    notifyListeners();
  }

  @override
  editToDo(ToDo toDo) async{
    todoAPIState.apiState = APIState.loading;
    todoAPIState.message = 'Loading';
    notifyListeners();
    var value = await APIService.editToDo(toDo);
    if(value is Success){
      log('ValueEdit', name: value.response.toString());
      todoAPIState.apiState = APIState.success;
      todoAPIState.message = 'Success';
    }else{
      todoAPIState.apiState = APIState.error;
      todoAPIState.message = 'Error';
    }
    notifyListeners();
  }

  @override
  getToDoList() async{
    todoAPIState.apiState = APIState.loading;
    todoAPIState.message = 'Loading';
    notifyListeners();
    var value = await APIService.getTodoList();
    if(value is Success){

      ToDoResponse toDoResponse = value.response as ToDoResponse;
      (toDoResponse.todoList as List<ToDo>).forEach((element) {
        log('DifferenceDate',name: differenceDate(element.date as String).toString());
        if(differenceDate(element.date as String) >= 1){
          deleteToDo(element.todoKey as String);
        }
      });
      todoAPIState.apiState = APIState.success;
      todoAPIState.data = toDoResponse.todoList;
      todoAPIState.message = 'Success';

      currentId = (toDoResponse.todoList.isNotEmpty)? toDoResponse.todoList.length : 0;

    }else{
      todoAPIState.apiState = APIState.error;
      todoAPIState.message = 'Error';
    }
    notifyListeners();
  }

  int increaseId(){
    return increaseID(currentId);
  }

  setDefaultAddAPIState(){
    addToDoAPIState.apiState = APIState.idle;
    notifyListeners();
  }

  @override
  deleteToDo(String key) async{
    todoAPIState.apiState = APIState.loading;
    notifyListeners();
    var value = await APIService.deleteToDo(key);
    if(value is Success){
      log('ValueDelete', name: value.response.toString());
      todoAPIState.apiState = APIState.success;
      todoAPIState.message = 'Success';
    }else{
      todoAPIState.apiState = APIState.error;
      todoAPIState.message = 'Error';
    }
    notifyListeners();
  }




}
