import 'package:flutter/cupertino.dart';
import 'package:todo/task_model.dart';

class TaskProvider extends ChangeNotifier {
  List<TaskModel> tasks = [
    TaskModel(text: "do the test", isComplete: false),
    TaskModel(text: "run the program", isComplete: false),
    TaskModel(text: "add commit push", isComplete: false),
  ];

  void addTask(String task) {
    TaskModel model = TaskModel(text: task, isComplete: false);
    tasks.add(model);
    notifyListeners();
  }

  void changeTaskStatusIndex(int index) {
    tasks[index].isComplete = !tasks[index].isComplete;
    notifyListeners();
  }
}
