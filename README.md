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

Dart library for scheduling tasks

# Scheduler

Runs the given callback after a specific duration

```dart
final Scheduler scheduler = Scheduler();

void printHello() => print('Hello');

scheduler.scheduleByDuration(Duration(seconds: 2), printHello);
```

# Scheduler Immediate

Runs the given callback asynchronously as soon as possible

```dart
final Scheduler scheduler = Scheduler();

void printHello() => print('Hello');

scheduler.scheduleByDuration(Duration(seconds: 2), printHello);
```

# Scheduler Periodic

Runs the given callback periodicly, to run a given time, add the count parameter

```dart
final Scheduler scheduler = Scheduler();

void printHello() => print('Hello');

scheduler.schedulePeriodic(Duration(seconds: 2), printHello, count: 3);
```

# Scheduler For a specific Time

Runs the given callback at a specific date time

```dart
final Scheduler scheduler = Scheduler();

void printHello() => print('Hello');

scheduler.scheduleByTime(DateTime(2023, 09, 05, 10, 10), printHello);
```

# License

Copyright © 2023 [Emile](https://github.com/solemil).
Released under the [MIT License](LICENSE).
