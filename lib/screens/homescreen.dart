import 'package:flutter/material.dart';

import 'package:crudapp/providers/jasonlistprovider.dart';
import 'package:crudapp/widgets/home_body.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listOfUnrealData = ref.watch(listOfUnrealDataProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('CRUD APP'),
      ),
      body: listOfUnrealData.when(
        data: (listOfUnrealData) {
          return HomeBody(listOfUnrealData: listOfUnrealData.reversed.toList());
        },
        error: (e, s) {
          return const Center(
              child: Text('Oops, something unexpected happened'));
        },
        loading: () => const Center(child: Text('loading...')),
      ),
    );
  }
}
