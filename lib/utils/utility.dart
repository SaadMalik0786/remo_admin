import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import 'constants.dart';

Widget getSubHeaderText(BuildContext context,String val){
  return Text(
    val,
    style: Theme.of(context)
        .textTheme
        .headlineSmall!
        .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
  );
}
Widget backWidget(context){
    return GestureDetector(
      onTap: (){
        GoRouter.of(context).pop();
      },
      child: const Row(
        children: [
          Icon(Icons.arrow_back,color: Const.kPrimary,),
          SizedBox(width: 5),
          Text("back",style: TextStyle(color: Const.kPrimary)),
        ],
      ),
    );
}

Future<DateTime?> selectDate(
    BuildContext context, DateTime selectedDate) async {
  final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101));
  return picked;
}

String formatDate(DateTime date) {
  DateFormat dateFormat = DateFormat("dd/MM/yyyy");

  return dateFormat.format(date);
}

Future<TimeOfDay?> selectTime(BuildContext context, TimeOfDay timeOfDay) async {
  TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: timeOfDay,
      builder: (BuildContext? context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context!).copyWith(alwaysUse24HourFormat: false),
          child: child!,
        );
      });

  return picked;
}
