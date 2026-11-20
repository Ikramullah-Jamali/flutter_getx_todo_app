// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_todo_app_practice/controllers/todo_controller.dart';
import 'package:my_todo_app_practice/models/Todo.dart';

class TodoScreen extends StatelessWidget {
  final Todo? todo;
  TodoScreen({super.key, this.todo});

  final TodoController todoController = Get.find();

  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController =
        TextEditingController(text: todo?.todoText ?? "");

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        elevation: 0,
        title: Text(
          todo == null ? "Add New ToDo" : "Edit ToDo",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 650),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: TextFormField(
                    controller: textEditingController,
                    autofocus: true,
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText: "What do you want to accomplish?",
                      border: InputBorder.none,
                      hintStyle: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ),
                ),
                Spacer(),
                SafeArea(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              padding: EdgeInsets.symmetric(vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {
                              Get.back();
                            },
                            child: Text(
                              "Cancel",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              padding: EdgeInsets.symmetric(vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {
                              if (textEditingController.text.trim().isEmpty) {
                                Get.snackbar(
                                  "Empty Task",
                                  "Please enter some text before saving",
                                  snackPosition: SnackPosition.BOTTOM,
                                );
                                return;
                              }
                              if (todo != null) {
                                todoController.updateTodo(
                                    todo!.id, textEditingController.text);
                              } else {
                                todoController.addTodoFromText(
                                    textEditingController.text);
                              }
                              Get.back();
                            },
                            child: Text(
                              todo == null ? "Save" : "Update",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}