import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSaveNewTask;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onSaveNewTask,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color(0xFFECDFCC),
      content: SizedBox(
        height: 200,
        width: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              style: TextStyle(fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                hintText: 'Enter task name',
                hintStyle: TextStyle(
                  color: Color(0xFF3C3D37),
                ),
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF3C3D37), width: 4.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),

            // save btn and cancel btn
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //save btn
                ElevatedButton(
                  onPressed: onSaveNewTask,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Color(0xFFECDFCC),
                    backgroundColor: Color(0xFF3C3D37),
                  ),
                  child: const Text('Save'),
                ),
                //cancel btn
                ElevatedButton(
                  onPressed: onCancel,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Color(0xFF3C3D37),
                    backgroundColor: Color(0xFFECDFCC),
                  ),
                  child: const Text('Cancel'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
