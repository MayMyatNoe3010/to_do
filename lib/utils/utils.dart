import 'dart:developer';

int increaseID(int id){
  return id + 1;
}

String getDateTimeString(){
  DateTime dateTime = DateTime.now();
  return '${dateTime.day}-${dateTime.month}-${dateTime.year}';
}

int differenceDate(String date){
  DateTime dob = DateTime.parse(date);
  log('DateTime',name: '$dob , ${DateTime.now()}');
  Duration dur =  DateTime.now().difference(dob);
  return dur.inDays;

}