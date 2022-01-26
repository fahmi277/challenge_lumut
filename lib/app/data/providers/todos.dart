import 'dart:convert';

import 'package:challenge_lumut/app/data/models/list_todos_model.dart';
import 'package:challenge_lumut/app/data/utils/secret.dart';
import 'package:http/http.dart' as http;

class JsonPlaceHolder {
  getTodosList() async {
    var url = Uri.parse(Secret().baseUrl);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      List<ListTodos> listTodos = listTodosFromJson(response.body);

      return listTodos;
    } else {
      return [];
    }
  }

  getDetails(int data) async {
    var url = Uri.parse(Secret().baseUrl + data.toString());
    var response = await http.get(url);
  }
}
