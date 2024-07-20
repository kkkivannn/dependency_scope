import 'package:dependency_scope/src/dependency_provider.dart';
import 'package:flutter/material.dart';

extension GetDependencyProviderExtension on BuildContext {
  DependencyProvider<T> get<T>() {
    final dep = DependencyProvider.of<T>(this);
    return dep;
  }
}
