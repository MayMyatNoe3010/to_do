import 'package:flutter/material.dart';

class NewTaskPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To Do'),
      ),
      body: SafeArea(
        child: Center(),
      ),
    );
  }
}
