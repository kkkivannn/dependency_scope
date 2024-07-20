import 'package:flutter/material.dart';

/// A final class that provides a dependency of type [T] to its widget subtree.
///
/// This class extends [InheritedWidget], allowing widgets to access
/// the provided dependency using the [of] method.
final class DependencyProvider<T> extends InheritedWidget {
  /// Creates a [DependencyProvider] widget.
  ///
  /// The [dependency] parameter is required and represents the dependency
  /// that will be provided to the widget subtree.
  const DependencyProvider({
    super.key,
    required super.child,
    required this.dependency,
  });

  /// The dependency of type [T] that is provided to the widget subtree.
  final T dependency;

  /// Determines whether the [DependencyProvider] should notify its descendants
  /// when the widget updates.
  ///
  /// Returns `false` because this implementation does not notify on updates.
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;

  /// Retrieves the nearest [DependencyProvider] up the widget tree that provides
  /// a dependency of type [T].
  ///
  /// The [context] parameter is used to locate the [DependencyProvider].
  /// Throws an assertion error if the dependency is not found.
  static DependencyProvider<T> of<T>(BuildContext context) {
    final di = context.getInheritedWidgetOfExactType<DependencyProvider<T>>();
    assert(di != null, "Dependency not found");
    return di!;
  }
}
