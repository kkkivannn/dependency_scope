import 'package:dependency_scope/dependency_scope.dart';

/// A final class that extends [DependencyScope] to manage application-specific dependencies.
final class AppDependency extends DependencyScope {
  /// The title of the application.
  late final String title;

  /// Initializes the dependencies for the application.
  ///
  /// This method overrides the [initialization] method from [DependencyScope]
  /// and sets up the [title] dependency by calling the [create] method.
  @override
  Future<void> initialization() async {
    title = await create(() => 'Flutter DI');
  }
}
