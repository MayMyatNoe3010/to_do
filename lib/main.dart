import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/provider/to_do_task_provider.dart';
import 'package:to_do/ui/pages/home_page.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ToDoTaskProvider().deliverProvider(),
    ], child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
