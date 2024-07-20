import 'dart:developer';

import 'package:dependency_scope/extensions/context.dart';
import 'package:flutter/material.dart';

import 'src/dependency_provider.dart';
import 'src/dependency_scope.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DependencyProvider<Dep>(
      dependency: Dep(),
      child: const App(),
    );
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final DependencyProvider dep = context.get<Dep>();
    log(dep.runtimeType.toString());
    return const Placeholder();
  }
}

final class Dep extends DependencyScope {
  Dep._();
  static get _instance => Dep._();
  factory Dep() => _instance;
}
