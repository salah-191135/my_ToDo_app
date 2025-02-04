import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todpapp/data/database.dart'; // Updated ToDoDB class
import 'package:todpapp/util/dialog_box.dart';
import 'package:todpapp/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = TextEditingController();
  ToDoDB db = ToDoDB();

  @override
  void initState() {
    super.initState();
    _initializeData(); // Initialize data when the app starts
  }

  // Initialize data
  Future<void> _initializeData() async {
    await db.init(); // Initialize SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString('TODOLIST') == null) {
      await db.createInitialData(); // Create initial data if it doesn't exist
    } else {
      await db.loadData(); // Load existing data
    }
    setState(() {}); // Refresh the UI
  }

  // Handle checkbox changes
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = value!;
    });
    db.updateData(); // Save changes
  }

  // Save a new task
  void saveNewTask() {
    setState(() {
      db.toDoList.add([controller.text, false]);
      controller.clear();
    });
    Navigator.of(context).pop();
    db.updateData(); // Save changes
  }

  // Show dialog to create a new task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: controller,
          onSaveNewTask: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  // Remove a task
  void removeTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateData(); // Save changes
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFECDFCC),
      appBar: AppBar(
        title: const Text(
          'My To-Do list',
          style: TextStyle(
            color: Color(0xFFECDFCC),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF3C3D37),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        backgroundColor: const Color(0xFF3C3D37),
        child: const Icon(Icons.add, color: Color(0xFFECDFCC), size: 30),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteTask: (context) => removeTask(index),
          );
        },
      ),
    );
  }
}