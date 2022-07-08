import 'package:daisy_application/app/pages/work_space/view/work_space_screen.dart';
import 'package:daisy_application/common/constants.dart';
import 'package:daisy_application/common/name_to_enum.dart';

enum WorkspaceTab {
  AppliedRequest,
  PostedRequest,
  AllProjects,
  ActiveProjects,
  CanceledProjects,
  DoneProjects
}

extension WorkspaceTabExt on WorkspaceState {
  WorkspaceTab getTab(int index) {
    switch (index) {
      case 0:
        return currentUser.role!.toUserRole() == UserRole.CUSTOMER
            ? WorkspaceTab.PostedRequest
            : WorkspaceTab.AppliedRequest;
      case 1:
        return WorkspaceTab.AllProjects;
      case 2:
        return WorkspaceTab.ActiveProjects;
      case 3:
        return WorkspaceTab.DoneProjects;
      case 4:
        return WorkspaceTab.CanceledProjects;
    }

    throw UnsupportedError('Not supported any tab with index $index');
  }

  int getTabIndex(WorkspaceTab tab) {
    switch (tab) {
      case WorkspaceTab.AppliedRequest:
      case WorkspaceTab.PostedRequest:
        return 0;
      case WorkspaceTab.AllProjects:
        return 1;
      case WorkspaceTab.ActiveProjects:
        return 2;
      case WorkspaceTab.DoneProjects:
        return 3;
      case WorkspaceTab.CanceledProjects:
        return 4;
    }
  }

  String getTabDisplayName(WorkspaceTab tab) {
    switch (tab) {
      case WorkspaceTab.AppliedRequest:
        return 'Đang ứng tuyển';
      case WorkspaceTab.PostedRequest:
        return 'Bài viết đã đăng';
      case WorkspaceTab.AllProjects:
        return 'Tất cả dự án';
      case WorkspaceTab.ActiveProjects:
        return 'Dự án đang hoạt động';
      case WorkspaceTab.CanceledProjects:
        return 'Dự án đã hủy';
      case WorkspaceTab.DoneProjects:
        return 'Dự án đã hoàn thành';
    }
  }
}
