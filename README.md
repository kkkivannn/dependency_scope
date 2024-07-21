<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

# Dependency Scope

Dependency Scope is a Flutter package designed to facilitate the use of Dependency Injection (DI) in Flutter projects.
This package provides a straightforward way to manage dependencies, improving code modularity and testability.

## Features

- Simplifies dependency injection setup in Flutter applications.
- Enhances code maintainability and readability.
- Supports easy and efficient management of app-wide dependencies.

## Installation
- Add the following to your pubspec.yaml file:
```yaml
dependencies:
  dependency_scope: ^1.1.0
```

## Getting started
- Setup: Initialize the DependencyScope in your main app file.
- Register Dependencies: Register your dependencies in the DependencyScope.
- Inject Dependencies: Use the provided methods to inject dependencies where needed.

## Usage

Include short and useful examples for package users. Add longer examples
to `/example` folder. 

```dart
final class AppDependency extends DependencyScope {
  late final String title;

  @override
  Future<void> initialization() async {
    title = await create(() => 'Flutter DI');
  }
}
```
And
```dart
class App extends StatelessWidget {
  final AppDependency appDependency;

  const App({super.key, required this.appDependency});

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
```
After this you can use DI with context extension
```dart
final appDependency = context.get<AppDependency>();
```
