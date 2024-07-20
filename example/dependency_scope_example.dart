import 'package:dependency_scope/dependency_scope.dart';
import 'package:dependency_scope/src/dependency_provider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DependencyProvider<Dep>(
      dependency: Dep(),
      child: MaterialApp(
        home: MyWidget(),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

final class Dep extends DependencyScope {
  Dep._();
  static get _instance => Dep._();
  factory Dep() => _instance;
}
