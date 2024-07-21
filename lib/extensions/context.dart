import 'package:dependency_scope/src/dependency_provider.dart';
import 'package:flutter/material.dart';

/// Extension on [BuildContext] to simplify accessing [DependencyProvider] instances.
extension GetDependencyProviderExtension on BuildContext {
  /// Retrieves the nearest [DependencyProvider] of type [T] from the widget tree.
  ///
  /// This method uses the [DependencyProvider.of] method to find the dependency
  /// and returns the found [DependencyProvider].
  ///
  /// Example usage:
  /// ```dart
  /// final myDependency = context.get<MyDependency>().dependency;
  /// ```
  T get<T>() {
    // Use DependencyProvider.of to find the nearest DependencyProvider of type T
    final dep = DependencyProvider.of<T>(this).dependency;
    return dep;
  }
}