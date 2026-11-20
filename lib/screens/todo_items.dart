import 'package:flutter/material.dart';
import 'package:my_todo_app_practice/models/Todo.dart';

class TodoItems extends StatelessWidget {
  final Todo todo;
  final VoidCallback onToggle;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const TodoItems({
    super.key,
    required this.todo,
    required this.onToggle,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        onTap: onEdit,
        dense: true,
        tileColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        title: Text(
          todo.todoText,
          style: TextStyle(
            fontSize: 16,
            decoration: todo.isdone ? TextDecoration.lineThrough : null,
            decorationColor: Colors.red,
            color: todo.isdone ? Colors.grey : Colors.black,
          ),
        ),
        leading: IconButton(
          onPressed: onToggle,
          icon: Icon(
            todo.isdone ? Icons.check_box : Icons.check_box_outline_blank,
            size: 25,
            color: todo.isdone ? Colors.blue : Colors.black54,
          ),
        ),
        trailing: Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(8),
          ),
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: onDelete,
            icon: Icon(
              Icons.delete,
              size: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}