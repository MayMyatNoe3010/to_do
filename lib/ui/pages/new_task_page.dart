import 'package:flutter/material.dart';
import 'package:to_do/res/styles.dart';

class NewTaskPage extends StatefulWidget {
  bool isEdit;
  NewTaskPage({super.key, required this.isEdit});

  @override
  State<StatefulWidget> createState() => _NewTaskPageState();
}

class _NewTaskPageState extends State<NewTaskPage> {
  final TextEditingController tecTask = TextEditingController();
  final TextEditingController tecNote = TextEditingController();
  TimeOfDay selectedTime = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To Do'),
      ),
      body: SafeArea(
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
                  onPressed: () {},
                  child: Text('Add'),
                ),
              ),
            ],
          ),
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
}
