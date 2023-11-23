import 'package:crudapp/models/unreal_data.dart';
import 'package:crudapp/screens/newpost_screen.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key, required this.listOfUnrealData});

  final List<UnrealData> listOfUnrealData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('POSTS'),
              IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) {
                          return const NewPostScreen();
                        },
                      ),
                    );
                  },
                  icon: const Icon(Icons.create))
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (_, i) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Container(
                    color: Colors.grey[400],
                    height: 130,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 70,
                            width: 70,
                            child: CircleAvatar(
                              child: Text(
                                'post${listOfUnrealData[i].id}',
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Text(
                              listOfUnrealData[i].title,
                              style: const TextStyle(fontSize: 17),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: listOfUnrealData.length,
            ),
          ),
        ],
      ),
    );
  }
}
