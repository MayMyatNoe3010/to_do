import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/provider/to_do_task_provider.dart';
import 'package:to_do/route_manager.dart';
import 'package:to_do/ui/pages/view/home_view.dart';

import '../../domain/model/to_do.dart';
import '../../provider/base/api_state_wrapper.dart';
import '../widgets/home_list_view_widget.dart';
import 'new_task_page.dart';

class HomePage extends StatelessWidget implements HomeView {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: getConsumer(context),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          goToNewTaskPage(context);
        },
        tooltip: 'AddNewTodo',
        child: const Icon(Icons.add),
      ),
    );
  }

  getConsumer(BuildContext context) {
    return Consumer<ToDoTaskProvider>(builder: (context, vm, child) {
      switch (vm.todoAPIState.apiState) {
        case APIState.idle:
          return getHomeWidget(vm);
        case APIState.loading:
          return showLoading(context);
        case APIState.error:
          return showError(context);
        default:
          return getHomeWidget(vm);
      }
    });
  }

  getHomeWidget(ToDoTaskProvider vm) {
    List<ToDo> todoList = [];
    todoList.add(ToDo('task', 'note', 'time', true));
    todoList.add(ToDo('task', 'note', 'time', false));
    DateTime today = DateTime.now();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Date: ${today.day}-${today.month}-${today.year}', style: TextStyle(
            fontSize: 20,
          ),),
          SizedBox(height: 16,),
          HomeListViewWidget(
            todoList: todoList//vm.todoAPIState.data as List<ToDo>,
          ),
        ],
      ),
    );
  }

  @override
  void goToNewTaskPage(BuildContext context) {
    RouteManager.goTo(context, NewTaskPage(isEdit: false,));
  }

  @override
  Widget showError(BuildContext context) {
    // TODO: implement showError
    throw UnimplementedError();
  }

  @override
  Widget showLoading(BuildContext context) {
    // TODO: implement showLoading
    throw UnimplementedError();
  }

  @override
  void editTask(BuildContext context) {
    // TODO: implement editTask
  }
}
