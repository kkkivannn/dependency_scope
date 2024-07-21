import 'package:dependency_scope/dependency_scope.dart';
import 'package:example/app/di/app_dependency.dart';
import 'package:flutter/material.dart';

/// Main application widget.
class App extends StatelessWidget {
  /// The dependency instance that will be provided to the widget tree.
  final AppDependency appDependency;

  /// Constructs the [App] widget.
  const App({super.key, required this.appDependency});

  /// Builds the widget tree for the application.
  ///
  /// Uses [DependencyProvider] to provide the [AppDependency] to the widget subtree.
  @override
  Widget build(BuildContext context) {
    return DependencyProvider<AppDependency>(
      dependency: appDependency,
      child: const MaterialApp(
        home: MyHomePage(),
      ),
    );
  }
}

///This is basic counter of Flutter project
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    /// Retrieve the AppDependency from the widget tree
    final dep = context.get<AppDependency>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        /// Retrieve the title from the AppDependency
        title: Text(dep.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
