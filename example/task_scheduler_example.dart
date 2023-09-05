import 'package:task_scheduler/scheduler_service.dart';

void main() {
  final Scheduler scheduler = Scheduler.notPersistent();

  void printScheduleImmediate() => print('Task Immediate');
  scheduler.scheduleImmediate(printScheduleImmediate);

  void printScheduleByDuration() => print('Scheduled for 2 sec');
  scheduler.scheduleByDuration(Duration(seconds: 2), printScheduleByDuration);

  void printScheduleByTime() => print('Scheduled for a pecific time');
  final DateTime dateTimeIn10seconds = DateTime.now().add(Duration(seconds: 10));
  scheduler.scheduleByTime(dateTimeIn10seconds, printScheduleByTime);

  void printSchedulePeriodic() => print('Scheduled peridodic task');
  scheduler.schedulePeriodic(Duration(seconds: 3), printSchedulePeriodic, count: 3);
}
