import 'package:flutter/cupertino.dart';

abstract class HomeView{
  Widget showLoading(BuildContext context);
  Widget showError(BuildContext context);
  void goToNewTaskPage(BuildContext context);
  void editTask(BuildContext context);

}