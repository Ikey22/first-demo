import 'package:first_demo/tasks_app/util/dialog_button.dart';
import 'package:flutter/material.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget({
    super.key,
    required this.onSave,
    required this.onCancel,
    required this.controller,
  });

  final VoidCallback onSave;
  final VoidCallback onCancel;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      content: Container(
        height: 120,
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Create a task'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                DialogButton(
                  text: 'Save',
                  onPressed: onSave,
                ),
                const SizedBox(
                  width: 8.0,
                ),
                DialogButton(
                  text: 'Cancel',
                  onPressed: onCancel,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
