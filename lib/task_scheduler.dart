library task_scheduler;

export 'src/task_scheduler_base.dart';

import 'dart:async';

/// A Task Scheduler
class Scheduler {
  schedule(Duration duration, void Function() callback) {
    Timer(duration, () {
      callback();
    });
  }

  scheduleImmediate(Function callback) {
    Timer.run(() {
      callback();
    });
  }

  schedulePeriodic(Duration duration, void Function() callback, int? count) {
    int counter = 0;
    Timer.periodic(duration, (timer) {
      callback();
      counter++;
      if (counter == count) timer.cancel();
    });
  }

  scheduleByTime(DateTime time, void Function() callback) {
    final now = DateTime.now();
    final duration = time.difference(now);
    schedule(duration, callback);
  }
}
