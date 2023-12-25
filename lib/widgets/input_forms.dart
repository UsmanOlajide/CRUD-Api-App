import 'package:flutter/material.dart';

class InputForms extends StatelessWidget {
  const InputForms({
    super.key,
    required this.userIdController,
    required this.titleController,
    required this.bodyController,
    required this.idController,
  });

  final TextEditingController userIdController;
  final TextEditingController titleController;
  final TextEditingController bodyController;
  final TextEditingController idController;

  Widget fieldBuilder(String title, Widget content) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 17),
        ),
        const SizedBox(width: 10),
        Expanded(child: content),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          fieldBuilder(
            'User Id',
            SizedBox(
              height: 30,
              child: TextField(
                controller: userIdController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  // floatingLabelBehavior: FloatingLabelBehavior.auto,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          fieldBuilder(
            'Id',
            SizedBox(
              height: 30,
              child: TextField(
                controller: idController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  // floatingLabelBehavior: FloatingLabelBehavior.auto,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          fieldBuilder(
            'Title',
            SizedBox(
              height: 30,
              child: TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  // floatingLabelBehavior: FloatingLabelBehavior.auto,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          fieldBuilder(
            'Body',
            TextField(
              controller: bodyController,
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
              maxLines: 3,
            ),
          ),
          const SizedBox(height: 27),
        ],
      ),
    );
  }
}
