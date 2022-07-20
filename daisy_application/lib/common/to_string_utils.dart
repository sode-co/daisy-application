import 'package:daisy_application/common/constants.dart';
import 'package:intl/intl.dart';

class DisplayName {
  static String fromProjectStatus(ProjectStatus status, UserRole role) {
    switch (status) {
      case ProjectStatus.DONE:
        return 'Completed';
      case ProjectStatus.IN_PROGRESS:
        return 'In progress';
      case ProjectStatus.CANCELED:
        return 'Canceled';
    }
  }

  static String fromRequestStatus(RequestStatus status, UserRole role) {
    switch (status) {
      case RequestStatus.AVAILABLE:
        switch (role) {
          case UserRole.CUSTOMER:
            return 'Open for apply';
          case UserRole.DESIGNER:
            return 'Processing';
        }
      case RequestStatus.TAKEN:
        return 'Taken';
    }
  }
}

class DisplayTime {
  final String name;
  final int number;

  DisplayTime(this.name, this.number);

  @override
  String toString() => number == 0 ? 'just now' : '$number $name ago';
}

extension DateTimeFormat on DateTime {
  String displayDateOnly() => DateFormat('dd/mm/yyyy').format(this);

  DisplayTime getDisplayTime() {
    double weeksCount =
        ((DateTime.now().millisecondsSinceEpoch - millisecondsSinceEpoch) /
            (1000 * 60 * 60 * 24) /
            7);

    if (weeksCount > 4) {
      return DisplayTime('months', (weeksCount % 4).toInt());
    } else if (weeksCount > 1) {
      return DisplayTime('weeks', weeksCount.toInt());
    } else if (weeksCount * 7 > 1) {
      return DisplayTime('days', (weeksCount * 7).toInt());
    } else if ((weeksCount * 7 * 24) > 1) {
      return DisplayTime('hours', (weeksCount * 7 * 24).toInt());
    } else if ((weeksCount * 7 * 24 * 60) > 1) {
      return DisplayTime('minutes', (weeksCount * 7 * 24 * 60).toInt());
    } else {
      return DisplayTime('', 0);
    }
  }
}
