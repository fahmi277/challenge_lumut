import 'package:challenge_lumut/app/data/providers/todos.dart';
import 'package:challenge_lumut/app/data/utils/custom_logger.dart';
import 'package:get/get.dart';
import 'package:challenge_lumut/app/data/models/list_todos_model.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  var listTodos;
  final isLoading = true.obs;
  final data = 0.obs;
  Rx<ListTodos> dataTodos = ListTodos().obs;
  @override
  void onInit() {
    super.onInit();
    getTodosData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  Future<void> getTodosData() async {
    try {
      listTodos = await JsonPlaceHolder().getTodosList();
      logger.d(listTodos);
      isLoading.value = false;
    } catch (e) {
      logger.e("cant parse");
      isLoading.value = false;
    }
  }
}
