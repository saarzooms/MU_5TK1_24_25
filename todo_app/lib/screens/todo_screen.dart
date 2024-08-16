import 'package:flutter/material.dart';

import '../models/todo.dart';
import '../services/api_call.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  List<Todo> tasks = [];
  int selId = 0; //selected item id

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    tasks = await APICall.fetchTodos();
    setState(() {});
  }

  TextEditingController txtTitle = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Todo App'),
        ),
        body: Column(
          children: [
            //add/update panel
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: txtTitle,
                      decoration: InputDecoration(
                        hintText: 'Enter title',
                        labelText: 'Title',
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    //todo add/update task
                    if (txtTitle.text.isNotEmpty) {
                      if (selId == 0) {
                        tasks.add(Todo(
                            id: DateTime.now().millisecondsSinceEpoch,
                            task: txtTitle.text,
                            completed: false));
                      } else {
                        int idx =
                            tasks.indexWhere((element) => element.id == selId);
                        if (idx > -1) {
                          var todo = tasks[idx];
                          todo.task = txtTitle.text;
                          tasks.removeAt(idx);
                          tasks.insert(idx, todo);
                          selId = 0;
                        }
                      }

                      txtTitle.clear();
                    }
                    setState(() {});
                  },
                  icon: Icon(Icons.add),
                ),
              ],
            ),
            //display list panel
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      onChanged: (v) {
                        tasks[index].completed = v;
                        setState(() {});
                      },
                      value: tasks[index].completed,
                      title: Text(
                        '${tasks[index].task} ${tasks[index].id}',
                        style: TextStyle(
                            decoration: tasks[index].completed!
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                            color: tasks[index].completed!
                                ? Colors.red
                                : Colors.black),
                      ),
                      secondary: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                txtTitle.text = tasks[index].task!;
                                selId = tasks[index].id!;
                                setState(() {});
                              },
                              icon: Icon(Icons.edit),
                            ),
                            IconButton(
                              onPressed: () {
                                //to perform delete
                                tasks.removeAt(index);
                                setState(() {});
                              },
                              icon: Icon(Icons.delete),
                            ),
                          ],
                        ),
                      ));
                },
              ),
            )
          ],
        ));
  }
}
