import 'package:crudapp/services/networking.dart';
import 'package:flutter/material.dart';

class NewPostScreen extends StatefulWidget {
  const NewPostScreen({super.key});

  @override
  State<NewPostScreen> createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  final titleController = TextEditingController();
  final bodyController = TextEditingController();
  final userIdController = TextEditingController();
  final baseUrl = 'https://jsonplaceholder.typicode.com/posts';

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
  void dispose() {
    titleController.dispose();
    bodyController.dispose();
    userIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('NEW POST'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                fieldBuilder(
                  'User Id',
                  SizedBox(
                    height: 50,
                    child: TextField(
                      controller: userIdController,
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
                    height: 50,
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
                    maxLines: 5,
                  ),
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black54,
                      foregroundColor: Colors.white),
                  onPressed: () async {
                    await networking.postSomething(
                      titleController.text,
                      bodyController.text,
                      int.tryParse(userIdController.text) ?? 0,
                    );
                    if (context.mounted) {
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text(
                    'Post',
                    style: TextStyle(fontSize: 17),
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
