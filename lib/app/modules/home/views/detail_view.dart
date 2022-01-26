import 'package:challenge_lumut/app/data/models/list_todos_model.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class DetailView extends GetView {
  ListTodos listTodos;
   DetailView({Key? key, required this.listTodos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Text(
          listTodos.toJson().toString(),
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
