import 'package:flutter/material.dart';

class ErrorsWidget extends StatelessWidget {
  String msg;

  ErrorsWidget({required this.msg});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            color: Colors.red,
            size: 50,
          ),
          Text(msg),
        ],
      ),
    );
  }
}
