import 'dart:developer';

import 'package:http/http.dart' as http;

import '../models/todo.dart';

class APICall {
  static fetchTodos() async {
    var todo = [];
    log('from fetchTodos');
    var request = http.Request(
        'GET', Uri.parse('https://node-todo-api-yjo3.onrender.com/todos/'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var resp = await response.stream.bytesToString();
      print(resp);
      todo = todoFromJson(resp);
    } else {
      print(response.reasonPhrase);
    }
    return todo;
  }
}
