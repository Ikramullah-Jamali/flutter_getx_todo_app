import 'package:get/get.dart';
import '../models/Todo.dart';

class TodoController extends GetxController {
  var todos = <Todo>[].obs;
  var searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    todos.assignAll(Todo.todoList());
  }

  List<Todo> get filteredTodos {
    if (searchQuery.value.trim().isEmpty) {
      return todos;
    }
    return todos
        .where((todo) => todo.todoText
            .toLowerCase()
            .contains(searchQuery.value.trim().toLowerCase()))
        .toList();
  }

  int get completedCount => todos.where((todo) => todo.isdone).length;

  void addTodoFromText(String text) {
    if (text.trim().isNotEmpty) {
      todos.insert(
        0,
        Todo(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          todoText: text.trim(),
        ),
      );
    }
  }

  void updateTodo(String id, String newText) {
    if (newText.trim().isNotEmpty) {
      final index = todos.indexWhere((todo) => todo.id == id);
      if (index != -1) {
        todos[index].todoText = newText.trim();
        todos.refresh();
      }
    }
  }

  void toggleTodo(String id) {
    final index = todos.indexWhere((todo) => todo.id == id);
    if (index != -1) {
      todos[index].isdone = !todos[index].isdone;
      todos.refresh();
    }
  }

  void deleteTodo(String id) {
    todos.removeWhere((todo) => todo.id == id);
  }

  void updateSearch(String query) {
    searchQuery.value = query;
  }
}