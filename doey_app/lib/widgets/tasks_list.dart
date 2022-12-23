import 'package:flutter/material.dart';
import 'package:doey_app/widgets/tasks_tile.dart';
import 'package:doey_app/models//task_data.dart';
import 'package:provider/provider.dart';


class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(itemBuilder: (context, index) {
          final task = taskData.tasks[index];
          return TaskTile(
              isChecked: taskData.tasks[index].isDone,
              title: taskData.tasks[index].name,
              checkBoxCallBack: (bool? checkBoxState) {
                taskData.updateTasks(task);
              },
            longPressedCallBack: (){
              taskData.deleteTask(task);
            },
          );
        },
          itemCount: taskData.taskCount,
        );
      }
    );
  }
}