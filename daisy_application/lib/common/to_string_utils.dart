import 'package:daisy_application/common/constants.dart';

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
            return 'Available';
          case UserRole.DESIGNER:
            return 'Available for applied';
        }
      case RequestStatus.TAKEN:
        switch (role) {
          case UserRole.CUSTOMER:
            return 'Already taken';
          case UserRole.DESIGNER:
            return 'Not available';
        }
    }
  }
}
