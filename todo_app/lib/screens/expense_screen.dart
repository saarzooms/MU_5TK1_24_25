import 'package:flutter/material.dart';

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({super.key});

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  List tasks = [
    {"id": 1, "title": "Buy iPhone", "isCompleted": false}
  ];
  int selId = 0; //selected item id
  TextEditingController txtTitle = TextEditingController();
  TextEditingController txtAmt = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Expense App'),
        ),
        body: Column(
          children: [
            //add/update panel
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: txtTitle,
                    decoration: InputDecoration(
                      hintText: 'Enter title',
                      labelText: 'Title',
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: txtAmt,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: 'Enter Amount',
                            labelText: 'Amount',
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        //todo add/update task
                        if (txtTitle.text.isNotEmpty) {
                          if (selId == 0) {
                            tasks.add({
                              "id": DateTime.now().millisecondsSinceEpoch,
                              "title": txtTitle.text,
                              "isCompleted": false
                            });
                          } else {
                            int idx = tasks.indexWhere(
                                (element) => element["id"] == selId);
                            if (idx > -1) {
                              var todo = tasks[idx];
                              todo['title'] = txtTitle.text;
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
              ],
            ),
            //display list panel
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${tasks[index]["title"]} ${tasks[index]["id"]}',
                            style: TextStyle(
                                decoration: tasks[index]["isCompleted"]
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                                color: tasks[index]["isCompleted"]
                                    ? Colors.red
                                    : Colors.black),
                          ),
                          Text(
                            '50000',
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      trailing: SizedBox(
                        width: 80,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                txtTitle.text = tasks[index]['title'];
                                selId = tasks[index]['id'];
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
            ),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              color: Colors.deepPurpleAccent,
              child: Text(
                "Total: 150",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ));
  }
}
