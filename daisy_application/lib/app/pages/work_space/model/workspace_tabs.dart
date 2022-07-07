import 'package:daisy_application/core_services/models/project/project_model.dart';
import 'package:daisy_application/core_services/models/request/request_model.dart';

abstract class WorkSpaceTab {}

class ActiveProjectTab extends WorkSpaceTab {
  final List<RequestModel> projects = [];
}

class AllPendingRequestTab extends WorkSpaceTab {
  final List<ProjectModel> projects = [];
}

class AllProjectTab extends WorkSpaceTab {
  final List<ProjectModel> projects = [];
}

class CanceledProjectTab extends WorkSpaceTab {
  final List<ProjectModel> projects = [];
}
