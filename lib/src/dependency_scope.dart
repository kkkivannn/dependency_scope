import 'dart:async';

import 'package:dependency_scope/src/logger.dart';

/// Abstract base class for managing dependency creation and initialization.
abstract base class DependencyScope {
  /// Creates and initializes a dependency of type [T].
  ///
  /// The [init] function is called to initialize the dependency.
  /// Logs the time taken for the initialization and handles any errors that occur during the process.
  ///
  /// Returns the initialized dependency of type [T].
  ///
  /// Example usage:
  /// ```dart
  /// final myDependency = await dependencyScope.create(() => MyDependency());
  /// ```
  final List<dynamic> _dependencies = [];

  Future<T> create<T>(FutureOr<T> Function() init) async {
    // Start a timer to measure the initialization duration.
    final timer = Stopwatch()..start();
    try {
      // Attempt to initialize the dependency.
      final dep = init();
      _dependencies.add(dep);
      return dep;
    } catch (error, stackTrace) {
      // Log an error message if initialization fails.
      logger.error('Error initializing dependency $T:', error: error, stackTrace: stackTrace);
      // Rethrow the caught error.
      rethrow;
    } finally {
      // Stop the timer and log the elapsed time for initialization.
      timer.stop();
      logger.info("Dependency initialized $T in ${timer.elapsedMilliseconds} ms. Count: ${_dependencies.length}");
    }
  }

  /// Abstract method for initializing dependencies.
  ///
  /// This method should be implemented by subclasses to perform any necessary
  /// initialization logic for dependencies.
  Future<void> initialization();
}
