# Flutter GetX ToDo App

A clean, responsive task management application built with **Flutter** and **GetX** for reactive state management and multi-screen navigation.

## Features

- **Full CRUD Operations:** Create new tasks, view all items, edit existing tasks, and delete completed or unwanted items.
- **Reactive State Management:** Powered by **GetX** (`GetxController` and `Obx`) for instant UI updates without boilerplate code.
- **Real-Time Search:** Filter tasks dynamically as you type in the search bar.
- **Task Progress Tracker:** Live completion counter displaying completed tasks out of the total list.
- **Multi-Screen Navigation:** Smooth navigation between the main dashboard (`HomeScreen`) and the task creation/editing screen (`TodoScreen`).
- **Responsive Layout:** Constrained and centered layout that adapts cleanly across mobile devices and wider web/desktop viewports.

## Project Structure
```text
lib/
├── controllers/
│   └── todo_controller.dart   # GetX state management, CRUD logic, and search filtering
├── models/
│   └── Todo.dart              # Todo data model and initial sample data
├── screens/
│   ├── home_screen.dart       # Main dashboard with search bar, task list, and progress counter
│   ├── todo_items.dart        # Reusable task card widget with toggle and delete actions
│   └── Todo_screen.dart       # Add and edit task screen
└── main.dart                  # App entry point configured with GetMaterialApp
```
## Tech Stack
Framework: Flutter (Dart)

State Management & Routing: GetX (get)

UI Components: Material Design

### Getting Started
Clone the repository:

git clone https://github.com/Ikramullah-Jamali/flutter_getx_todo_app.git
Navigate to the project directory:

cd flutter_getx_todo_app
Install dependencies:

flutter pub get
Run the application:

flutter run

## Author
### Ikramullah Jamali

