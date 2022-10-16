import 'package:flutter/material.dart';
import 'package:to_do/main.dart';
import 'package:to_do/provider/base/api_state_wrapper.dart';
import 'package:to_do/provider/base/base_presenter.dart';

import '../domain/use_case/home_use_case.dart';

class ToDoTaskProvider extends BasePresenter implements Home{
  APIStateWrapper todoAPIState = APIStateWrapper(apiState: APIState.idle, data:  null, message: '');
  @override
  deliverProvider() {
    return super.makeProvider(this);
  }

  @override
  addToDo() {
    // TODO: implement addToDo
    throw UnimplementedError();
  }

  @override
  editToDo() {
    // TODO: implement editToDo
    throw UnimplementedError();
  }

  @override
  getToDoList() {
    // TODO: implement getToDoList
    throw UnimplementedError();
  }
}