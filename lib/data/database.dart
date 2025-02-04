import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert'; // For JSON encoding/decoding

class ToDoDB {
  List toDoList = [];

  // Initialize SharedPreferences
  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    // No need to do anything else here
  }

  // Initialize the database with initial data on first run
  Future<void> createInitialData() async {
    toDoList = [
      ['Task 1', false],
      ['Task 2', false],
      ['Task 3', false],
    ];
    await updateData(); // Save initial data to SharedPreferences
  }

  // Load data from SharedPreferences
  Future<void> loadData() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString('TODOLIST');
    if (jsonString != null) {
      toDoList = jsonDecode(jsonString);
    }
  }

  // Update data in SharedPreferences
  Future<void> updateData() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = jsonEncode(toDoList);
    await prefs.setString('TODOLIST', jsonString);
  }
}