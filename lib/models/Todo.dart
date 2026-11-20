// ignore: file_names

class Todo {
  String id;
  String todoText;
  bool isdone;

  Todo({required this.id, required this.todoText, this.isdone = false});

  static List<Todo> todoList() {
    return [
      Todo(id: "01", todoText: "Maths", isdone: true),
      Todo(id: "02", todoText: "Science", isdone: false),
      Todo(id: "03", todoText: "English", isdone: true),
      Todo(id: "04", todoText: "Biology", isdone: false),
      Todo(id: "05", todoText: "Chemistry", isdone: false),
      Todo(id: "06", todoText: "Physics", isdone: true),
      Todo(id: "07", todoText: "Urdu", isdone: true),
    ];
  }
}