import 'package:daisy_application/pages/common/responsive.dart';
import 'package:daisy_application/pages/requests-page/view/stateless_component.dart';
import 'package:flutter/material.dart';

class MyWorkSpace extends StatefulWidget {
  const MyWorkSpace({Key? key}) : super(key: key);

  @override
  State<MyWorkSpace> createState() => _MyWorkSpaceState();
}

class _MyWorkSpaceState extends State<MyWorkSpace> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade200,
      child: Padding(
        padding: const EdgeInsets.only(left: 100.0, top: 30.0, right: 100.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade200),
            color: Colors.white,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 10.0,
              left: 10.0,
            ),
            child: Row(
              children: <Widget>[
                NavigationRail(
                  selectedIndex: _selectedIndex,
                  onDestinationSelected: (int index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  labelType: NavigationRailLabelType.selected,
                  destinations: <NavigationRailDestination>[
                    NavigationRailDestination(
                      icon: Responsive.isDesktop(context)
                          ? const LabelAndIcon(
                              icondata: Icons.pending_outlined,
                              isActive: false,
                              label: 'Dự án đã đăng',
                            )
                          : const Tooltip(
                              message: 'Dự án đã đăng',
                              child: Icon(Icons.pending_outlined),
                            ),
                      selectedIcon: Responsive.isDesktop(context)
                          ? const LabelAndIcon(
                              icondata: Icons.pending_outlined,
                              isActive: true,
                              label: 'Dự án đã đăng',
                            )
                          : const Tooltip(
                              message: 'Dự án đã đăng',
                              child: Icon(Icons.pending_outlined),
                            ),
                      label: const SizedBox(height: 0),
                    ),
                    NavigationRailDestination(
                      icon: Responsive.isDesktop(context)
                          ? const LabelAndIcon(
                              icondata: Icons.cloud_sync_outlined,
                              isActive: false,
                              label: 'Dự án đang hoạt động',
                            )
                          : const Tooltip(
                              message: 'Dự án đang hoạt động',
                              child: Icon(Icons.cloud_sync_outlined),
                            ),
                      selectedIcon: Responsive.isDesktop(context)
                          ? const LabelAndIcon(
                              icondata: Icons.cloud_sync_outlined,
                              isActive: true,
                              label: 'Dự án đang hoạt động',
                            )
                          : const Tooltip(
                              message: 'Dự án đang hoạt động',
                              child: Icon(Icons.cloud_sync_outlined),
                            ),
                      label: const SizedBox(height: 0),
                    ),
                    NavigationRailDestination(
                      icon: Responsive.isDesktop(context)
                          ? const LabelAndIcon(
                              icondata: Icons.highlight_off_outlined,
                              isActive: false,
                              label: 'Dự án đã hủy',
                            )
                          : const Tooltip(
                              message: 'Dự án đã hủy',
                              child: Icon(Icons.highlight_off_outlined),
                            ),
                      selectedIcon: Responsive.isDesktop(context)
                          ? const LabelAndIcon(
                              icondata: Icons.highlight_off_outlined,
                              isActive: true,
                              label: 'Dự án đã hủy',
                            )
                          : const Tooltip(
                              message: 'Dự án đã hủy',
                              child: Icon(Icons.highlight_off_outlined),
                            ),
                      label: const SizedBox(height: 0),
                    ),
                    NavigationRailDestination(
                      icon: Responsive.isDesktop(context)
                          ? const LabelAndIcon(
                              icondata: Icons.done_all_outlined,
                              isActive: false,
                              label: 'Dự án hoàn thành',
                            )
                          : const Tooltip(
                              message: 'Dự án hoàn thành',
                              child: Icon(Icons.done_all_outlined),
                            ),
                      selectedIcon: Responsive.isDesktop(context)
                          ? const LabelAndIcon(
                              icondata: Icons.done_all_outlined,
                              isActive: true,
                              label: 'Dự án hoàn thành',
                            )
                          : const Tooltip(
                              message: 'Dự án hoàn thành',
                              child: Icon(Icons.done_all_outlined),
                            ),
                      label: const SizedBox(height: 0),
                    ),
                  ],
                ),
                const VerticalDivider(thickness: 1, width: 1),
                // This is the main content.
                if (_selectedIndex == 0) const Text('Dự án đã đăng'),
                if (_selectedIndex == 1) const Text('Dự án đang hoạt động'),
                if (_selectedIndex == 2) const Text('Dự án đã hủy'),
                if (_selectedIndex == 3) const Text('Dự án hoàn thành'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
