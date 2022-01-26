// To parse this JSON data, do
//
//     final listTodos = listTodosFromJson(jsonString);

import 'dart:convert';

List<ListTodos> listTodosFromJson(String str) =>
    List<ListTodos>.from(json.decode(str).map((x) => ListTodos.fromJson(x)));

String listTodosToJson(List<ListTodos> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ListTodos {
  ListTodos({
    this.userId = 0,
    this.id = 0,
    this.title = "",
    this.completed = false,
  });

  int userId;
  int id;
  String title;
  bool completed;

  factory ListTodos.fromJson(Map<String, dynamic> json) => ListTodos(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "completed": completed,
      };
}
