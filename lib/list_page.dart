import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:todo/task_provider.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List"),
        backgroundColor: Color.fromARGB(255, 206, 156, 5),
        actions: [
          IconButton(
              onPressed: () {
                context.push("/add");
              },
              icon: Icon(
                Icons.add_box_outlined,
              ))
        ],
      ),
      body: ListView.builder(
          itemCount: context.watch<TaskProvider>().tasks.length,
          itemBuilder: ((context, index) => Container(
                height: 80,
                child: Card(
                  color: Colors.amber[100],
                  child: Row(
                    children: [
                      Checkbox(
                          value: context
                              .watch<TaskProvider>()
                              .tasks[index]
                              .isComplete,
                          onChanged: (value) {
                            var taskProvider = context.read<TaskProvider>();

                            taskProvider.changeTaskStatusIndex(index);
                          }),
                      Text(
                        context.watch<TaskProvider>().tasks[index].text,
                        style: TextStyle(fontSize: 24),
                      ),
                      Spacer(),
                      IconButton(onPressed: null, icon: Icon(Icons.delete)),
                    ],
                  ),
                ),
              ))),
    );
  }
}
