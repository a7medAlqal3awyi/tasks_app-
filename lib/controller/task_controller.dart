import 'package:get/get.dart';
import 'package:task_app/db/db_helper.dart';
import 'package:task_app/models/task_model.dart';

class TaskController extends GetxController {
  @override
  void onReady() {
    getTask();
    super.onReady();
  }

  var taskList = <TaskModel>[].obs;

  Future<int> addTask({TaskModel? task}) async {
    return await DBHelper.insert(task);
  }

  getTask() async {
    List<Map<String, dynamic>> tasks = await DBHelper.query();
    taskList.assignAll(tasks.map((data) => TaskModel.fromJson(data)).toList());
  }
}
