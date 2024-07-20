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
  Future<T> create<T>(T Function() init) async {
    // Start a timer to measure the initialization duration.
    final timer = Stopwatch()..start();
    try {
      // Attempt to initialize the dependency.
      return init();
    } catch (error, stackTrace) {
      // Log an error message if initialization fails.
      logger.error('Error initializing dependency $T:', error: error, stackTrace: stackTrace);
      // Rethrow the caught error.
      rethrow;
    } finally {
      // Stop the timer and log the elapsed time for initialization.
      timer.stop();
      logger.info("Dependency initialized $T in ${timer.elapsedMilliseconds} ms");
    }
  }
}
