import 'package:daisy_application/common/constants.dart';

extension EnumCreator on String {
  UserRole toUserRole() {
    switch (this) {
      case 'CUSTOMER':
        return UserRole.CUSTOMER;
      case 'DESIGNER':
        return UserRole.DESIGNER;
    }

    throw UnsupportedError('UserRole not include any value name $this');
  }

  ProjectStatus toProjectStatus() {
    switch (this) {
      case 'DONE':
        return ProjectStatus.DONE;
      case 'IN_PROGRESS':
        return ProjectStatus.IN_PROGRESS;
      case 'CANCELED':
        return ProjectStatus.CANCELED;
    }

    throw UnsupportedError('ProjectStatus not include any value name $this');
  }

  RequestStatus toRequestStatus() {
    switch (this) {
      case 'AVAILABLE':
        return RequestStatus.AVAILABLE;
      case 'TAKEN':
        return RequestStatus.TAKEN;
    }

    throw UnsupportedError('RequestStatus not include any value name $this');
  }
}
