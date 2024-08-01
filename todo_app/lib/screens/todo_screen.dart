import 'package:flutter/material.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  List tasks = [
    {"id": 1, "title": "Buy iPhone", "isCompleted": false}
  ];
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
                      tasks.add({
                        "id": 1,
                        "title": txtTitle.text,
                        "isCompleted": false
                      });
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
                        tasks[index]["isCompleted"] = v;
                        setState(() {});
                      },
                      value: tasks[index]["isCompleted"],
                      title: Text(
                        '${tasks[index]["title"]}',
                        style: TextStyle(
                            decoration: tasks[index]["isCompleted"]
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                            color: tasks[index]["isCompleted"]
                                ? Colors.red
                                : Colors.black),
                      ),
                      secondary: SizedBox(
                        width: 80,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.edit),
                            ),
                            IconButton(
                              onPressed: () {},
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
