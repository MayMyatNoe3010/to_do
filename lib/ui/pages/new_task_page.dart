import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/domain/model/to_do.dart';
import 'package:to_do/provider/base/api_state_wrapper.dart';
import 'package:to_do/provider/base/viewmodel_factory.dart';
import 'package:to_do/provider/to_do_task_provider.dart';
import 'package:to_do/res/styles.dart';
import 'package:to_do/route_manager.dart';
import 'package:to_do/ui/pages/home_page.dart';
import 'package:to_do/ui/pages/view/new_task_view.dart';
import 'package:to_do/ui/widgets/loading_widget.dart';

import '../widgets/error_widget.dart';

class NewTaskPage extends StatefulWidget implements NewTaskView{

  const NewTaskPage({super.key});

  @override
  State<StatefulWidget> createState() => _NewTaskPageState();

  @override
  goBackToHomePage(BuildContext context) {
    Future.delayed(Duration.zero,(){
      RouteManager.goToAndRemoveBackStack(context, HomePage());
    });
  }

  @override
  showLoading(BuildContext context) {
    return LoadingWidget(msg: 'Loading');
  }

  @override
  showError(BuildContext context, String msg) {
    return ErrorsWidget(msg: msg);
  }
}

class _NewTaskPageState extends State<NewTaskPage> {
  final TextEditingController tecTask = TextEditingController();
  final TextEditingController tecNote = TextEditingController();
  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    ToDoTaskProvider provider = getProvider<ToDoTaskProvider>(context);
    provider.setDefaultAddAPIState();
    return Scaffold(
      appBar: AppBar(
        title: Text('To Do'),
      ),
      body: getConsumer(context)
    );
  }

  _getNewTaskPageWidget(BuildContext context, ToDoTaskProvider provider){
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: tecTask,
              decoration: InputDecoration(
                hintText: "Enter Task",
                labelText: "Task",
                fillColor: Colors.white,
                focusedBorder: Styles.getOutlineBorder(Colors.blue),
                enabledBorder: Styles.getOutlineBorder(Colors.blueAccent),
                errorBorder: Styles.getOutlineBorder(Colors.red),
              ),
            ),
            SizedBox(
              height: 32,
            ),
            TextField(
              controller: tecNote,
              keyboardType: TextInputType.multiline,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: "Enter Note",
                labelText: "Note",
                fillColor: Colors.white,
                focusedBorder: Styles.getOutlineBorder(Colors.blue),
                enabledBorder: Styles.getOutlineBorder(Colors.blueAccent),
                errorBorder: Styles.getOutlineBorder(Colors.red),
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Time: ${selectedTime.hour}:${selectedTime.minute}'),
                IconButton(
                  onPressed: () {
                    selectTimeFromTimePicker(context);
                  },
                  icon: Icon(Icons.access_time),
                  iconSize: 30,
                ),
              ],
            ),
            SizedBox(
              height: 32,
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () {

                  ToDo todo = ToDo(task: tecTask.text, note: tecNote.text, time: '${selectedTime.hour}:${selectedTime.minute}',isComplete: false);
                  log('Add btn ',name: 'pressed -> $todo');
                  provider.addToDo(todo);

                },
                child: Text('Add'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void selectTimeFromTimePicker(BuildContext context) async {
    final TimeOfDay? timeOfDay =
        await showTimePicker(context: context, initialTime: selectedTime);
    if (timeOfDay != null && timeOfDay != selectedTime) {
      setState(() {
        selectedTime = timeOfDay;
      });
    }
  }

  getConsumer(BuildContext context) {
    return Consumer<ToDoTaskProvider>(builder: (context, vm, child){
       switch(vm.addToDoAPIState.apiState){
         case APIState.success : return const NewTaskPage().goBackToHomePage(context);
         case APIState.loading : return NewTaskPage().showLoading(context);
         case APIState.error : return NewTaskPage().showError(context, vm.addToDoAPIState.message);
         default: return _getNewTaskPageWidget(context, vm);
       }
    });
  }
}
