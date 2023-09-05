import 'dart:async';

abstract class SchedulerService {
  void scheduleByDuration(Duration duration, void Function() callback);
  void scheduleImmediate(void Function() callback);
  void schedulePeriodic(Duration duration, void Function() callback, {int? count});
  void scheduleByTime(DateTime time, void Function() callback);
}

abstract class TaskStore {
  void save(Duration? duration);
  void restartScheduler();
}

class Scheduler implements SchedulerService {
  final TaskStore? taskStore;

  Scheduler(this.taskStore);

  Scheduler.notPersistent() : this(null);

  @override
  void scheduleByDuration(Duration duration, void Function() callback) {
    Timer(duration, () {
      callback();
    });
  }

  @override
  void scheduleImmediate(void Function() callback) {
    Timer.run(() {
      callback();
    });
  }

  @override
  void schedulePeriodic(Duration duration, void Function() callback, {int? count}) {
    int counter = 0;
    Timer.periodic(duration, (timer) {
      callback();
      if (count != null) {
        counter++;
        if (counter == count) timer.cancel();
      }
    });
  }

  @override
  void scheduleByTime(DateTime time, void Function() callback) {
    final now = DateTime.now();
    final duration = time.difference(now);
    scheduleByDuration(duration, callback);
  }
}
