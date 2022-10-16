import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:to_do/provider/to_do_task_provider.dart';
import 'package:to_do/route_manager.dart';
import 'package:to_do/ui/pages/view/home_view.dart';

import '../../provider/base/api_state_wrapper.dart';
import '../widgets/home_list_view_widget.dart';
import 'new_task_page.dart';

class HomePage extends StatelessWidget implements HomeView{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: getConsumer(context),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          goToNewTaskPage(context);
        },
        tooltip: 'AddNewTodo',
        child: const Icon(Icons.add),
      ),

    );
  }

  getConsumer(BuildContext context) {
    return Consumer<ToDoTaskProvider>(builder: (context, vm, child){
      switch(vm.todoAPIState.apiState){
        case APIState.idle: return getHomeWidget();
        case APIState.loading: return showLoading(context);
        case APIState.error: return showError(context);
        default: return getHomeWidget();
      }
    });
  }
  
  getHomeWidget(){
    return HomeListViewWidget(todoList: [],);
    
  }
  
  
  
  


  @override
  void goToNewTaskPage(BuildContext context) {
    RouteManager.goTo(context, NewTaskPage());
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
  }}

