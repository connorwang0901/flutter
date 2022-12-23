import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String title;
  final void Function(bool?) checkBoxCallBack;
  final void Function() longPressedCallBack;

  TaskTile({required this.isChecked, required this.title, required this.checkBoxCallBack, required this.longPressedCallBack});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressedCallBack,
      title: Text(
        title,
        style: TextStyle(fontSize: 18.0,
        decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        value: isChecked,
        activeColor: Colors.lightBlueAccent,
        onChanged: checkBoxCallBack,
      ),
    );
  }
}



