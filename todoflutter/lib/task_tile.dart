// ignore_for_file: use_super_parameters, prefer_const_constructors

import "package:flutter/material.dart";
import "package:todoflutter/models/task.dart";
import "package:todoflutter/models/tasks_data.dart";
class TaskTile extends StatelessWidget{
  final Task task;
  final TasksData tasksData;
  const TaskTile({Key?key, required this.task, required this.tasksData}): super(key: key);
  @override
Widget build(BuildContext context)
{
  return Card(
    child:ListTile(
      leading: Checkbox(
        activeColor: Colors.green,
        value: task.done,
        onChanged: (checkbox){
          tasksData.updateTask(task);
        },
      ),
      title:Text(task.title,
      style:TextStyle(
        decoration: task.done?TextDecoration.lineThrough:TextDecoration.none,
      ),
      ),
      trailing: IconButton(
        icon: const Icon( Icons.clear),
        onPressed: (){
          tasksData.deleteTask(task);
        },
      ),
      )
    );
}
}
