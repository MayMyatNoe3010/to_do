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
/*
Future<void> readData() async {

    // Please replace the Database URL
    // which we will get in “Add Realtime Database”
    // step with DatabaseURL

    var url = "DatabaseURL"+"data.json";
    // Do not remove “data.json”,keep it as it is
    try {
      final response = await http.get(Uri.parse(url));
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      extractedData.forEach((blogId, blogData) {
        list.add(blogData["title"]);
      });
      setState(() {
        isLoading = false;
      });
    } catch (error) {
      throw error;
    }
  }

  void writeData() async {
    _form.currentState.save();

    // Please replace the Database URL
    // which we will get in “Add Realtime
    // Database” step with DatabaseURL
    var url = "https://console.firebase.google.com/u/0/project/todoflutter-58e74"+"data.json";

    // (Do not remove “data.json”,keep it as it is)
    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode({"title": title}),
      );
    } catch (error) {
      throw error;
    }
  }
 */