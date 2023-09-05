import 'package:task_scheduler/scheduler_service.dart';
import 'package:test/test.dart';

void main() {
  group('Scheduler tests', () {
    late Scheduler scheduler;

    setUp(() {
      scheduler = Scheduler.notPersistent();
    });

    test('scheduled task should executed after 2 seconds', () async {
      bool executed = false;

      setExecuted() {
        executed = true;
      }

      scheduler.scheduleByDuration(const Duration(seconds: 2), setExecuted);

      expect(executed, isFalse);

      await Future.delayed(const Duration(seconds: 3));

      expect(executed, isTrue);
    });

    test('scheduled task should be executed immediately', () async {
      bool executed = false;

      setExecuted() {
        executed = true;
      }

      scheduler.scheduleImmediate(setExecuted);

      await Future.delayed(const Duration(seconds: 3));

      expect(executed, isTrue);
    });

    test('scheduled periodic task should executed after 2 seconds 3 times', () async {
      int counter = 0;

      setCounter() {
        counter++;
      }

      scheduler.schedulePeriodic(const Duration(seconds: 2), setCounter, count: 3);

      await Future.delayed(const Duration(seconds: 7));

      expect(counter, 3);
    });
  });
}
