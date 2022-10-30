import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/provider/to_do_task_provider.dart';
import 'package:to_do/route_manager.dart';
import 'package:to_do/ui/pages/view/home_view.dart';
import 'package:to_do/ui/widgets/error_widget.dart';
import 'package:to_do/ui/widgets/loading_widget.dart';

import '../../domain/model/to_do.dart';
import '../../provider/base/api_state_wrapper.dart';
import '../../provider/base/viewmodel_factory.dart';
import '../widgets/home_list_item_widget.dart';
import 'new_task_page.dart';

class HomePage extends StatelessWidget implements HomeView {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ToDoTaskProvider provider = getProvider<ToDoTaskProvider>(context);
    if(provider.isFirstCall){
      Future.delayed(Duration.zero,(){
        provider.getToDoList();
      });
    }


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
      log('APIStaate', name: '${vm.todoAPIState.apiState}');
      switch (vm.todoAPIState.apiState) {
        // case APIState.idle:
        //   return getHomeWidget(vm);
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
    List<ToDo> todoList = vm.todoAPIState.data as List<ToDo>;

    DateTime today = DateTime.now();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Date: ${today.day}-${today.month}-${today.year}',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: todoList.length,
              itemBuilder: (BuildContext context, int index) {
                ToDo todo = todoList[index];
                return InkWell(child: HomeListItemWidget(todo: todo),
                onTap: (){
                  editTask(context);
                },);
              })
        ],
      ),
    );
  }

  @override
  void goToNewTaskPage(BuildContext context) {
    RouteManager.goTo(
        context,
        NewTaskPage());
  }

  @override
  Widget showError(BuildContext context) {
    return ErrorsWidget(msg: 'error');
  }

  @override
  Widget showLoading(BuildContext context) {
    return LoadingWidget(msg: 'Loading');
  }

  @override
  void editTask(BuildContext context) {
    // TODO: implement editTask
  }
}
