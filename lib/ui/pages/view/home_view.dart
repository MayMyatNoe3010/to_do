import 'package:flutter/cupertino.dart';
import 'package:to_do/domain/model/to_do.dart';

abstract class HomeView{
  Widget showLoading(BuildContext context);
  Widget showError(BuildContext context);
  void goToNewTaskPage(BuildContext context);
  void editTask(BuildContext context, ToDo toDo);

}