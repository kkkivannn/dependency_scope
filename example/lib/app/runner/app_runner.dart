import 'package:example/app/di/app_dependency.dart';
import 'package:example/app/runner/app.dart';
import 'package:flutter/material.dart';

/// An abstract class responsible for running the application.
abstract class AppRunner {
  /// Initializes the application's dependencies and runs the Flutter app.
  ///
  /// This static method creates an instance of [AppDependency], initializes it,
  /// and then starts the Flutter app by calling [runApp] with the [App] widget,
  /// passing the initialized [AppDependency] instance.
  static Future<void> run() async {
    // Create an instance of AppDependency to manage application-specific dependencies.
    final appDependency = AppDependency();

    // Initialize the dependencies.
    await appDependency.initialization();

    // Run the Flutter app, providing the initialized AppDependency instance.
    runApp(App(appDependency: appDependency));
  }
}
