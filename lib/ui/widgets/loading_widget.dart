import 'package:flutter/cupertino.dart';

class LoadingWidget extends StatelessWidget {
  String msg;
  LoadingWidget({
    Key? key,
    required this.msg,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(msg),
        SizedBox(
          height: 16,
        ),
        const CupertinoActivityIndicator(),
      ],
    );
  }
}