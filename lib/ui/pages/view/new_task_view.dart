import 'package:flutter/material.dart';

abstract class NewTaskView{
  showLoading(BuildContext context);
  showError(BuildContext context, String msg);
  goBackToHomePage(BuildContext context);
}