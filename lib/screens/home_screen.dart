import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_todo_app_practice/controllers/todo_controller.dart';
import 'package:my_todo_app_practice/screens/Todo_screen.dart';
import 'package:my_todo_app_practice/screens/todo_items.dart';
import '../models/Todo.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TodoController todoController = Get.put(TodoController());

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.menu, color: Colors.black),
            ),
            Text(
              "GetX Todo App",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            CircleAvatar(
              backgroundColor: Colors.blue,
              child: Icon(Icons.person, color: Colors.white),
            ),
          ],
        ),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 650),
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    searchBox(todoController),
                    Expanded(
                      child: Obx(() {
                        final visibleTodos = todoController.filteredTodos;
                        return ListView(
                          padding: EdgeInsets.only(bottom: 110),
                          children: [
                            SizedBox(height: 15),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "All ToDos",
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 6),
                                    decoration: BoxDecoration(
                                      color: Colors.blue.shade50,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      "${todoController.completedCount}/${todoController.todos.length} Done",
                                      style: TextStyle(
                                        color: Colors.blue.shade700,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 15),
                            if (visibleTodos.isEmpty)
                              Padding(
                                padding: EdgeInsets.only(top: 60),
                                child: Center(
                                  child: Text(
                                    "No ToDos found",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                ),
                              )
                            else
                              for (Todo todo in visibleTodos)
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: TodoItems(
                                    todo: todo,
                                    onToggle: () =>
                                        todoController.toggleTodo(todo.id),
                                    onDelete: () =>
                                        todoController.deleteTodo(todo.id),
                                    onEdit: () =>
                                        Get.to(() => TodoScreen(todo: todo)),
                                  ),
                                ),
                          ],
                        );
                      }),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: SafeArea(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 25, right: 20),
                    child: FloatingActionButton.extended(
                      backgroundColor: Colors.blue,
                      onPressed: () {
                        Get.to(() => TodoScreen());
                      },
                      icon: Icon(Icons.add, color: Colors.white),
                      label: Text(
                        "Add ToDo",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget searchBox(TodoController controller) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
    child: TextField(
      onChanged: (value) => controller.updateSearch(value),
      decoration: InputDecoration(
        hintText: "Search",
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        prefixIcon: Icon(
          Icons.search,
          color: Colors.black,
        ),
      ),
    ),
  );
}