import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'smanager.g.dart';

@riverpod
String helloWorld(HelloWorldRef ref) {
  return 'Hello world';
}