import 'package:daisy_application/app/common/colors.dart';
import 'package:daisy_application/app/common/responsive.dart';
import 'package:flutter/material.dart';

import 'design.dart';

class SideBarItem {
  final String label;
  final IconData icon;

  SideBarItem({required this.label, required this.icon});
}

class SideBar extends StatefulWidget {
  final List<SideBarItem> items;
  final Future<void> Function(int)? onTabChanged;
  final int selectedTabIndex;

  const SideBar(
      {Key? key,
      required this.items,
      this.onTabChanged,
      required this.selectedTabIndex})
      : super(key: key);

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    int index = 0;
    return NavigationRail(
      selectedIndex: widget.selectedTabIndex,
      onDestinationSelected: widget.onTabChanged,
      labelType: NavigationRailLabelType.selected,
      destinations: widget.items.map((item) {
        return _createNavItem(
            item.label, item.icon, index++ == widget.selectedTabIndex);
      }).toList(),
    );
  }

  NavigationRailDestination _createNavItem(
          String label, IconData icon, bool isActive) =>
      NavigationRailDestination(
        icon: Responsive.isDesktop(context)
            ? _LabelAndIcon(
                icondata: icon,
                isActive: isActive,
                label: label,
              )
            : Tooltip(message: label, child: Icon(icon)),
        selectedIcon: Responsive.isDesktop(context)
            ? _LabelAndIcon(
                icondata: icon,
                isActive: isActive,
                label: label,
              )
            : Tooltip(message: label, child: Icon(icon)),
        label: const SizedBox(height: 0),
      );
}

class _LabelAndIcon extends StatelessWidget {
  const _LabelAndIcon(
      {Key? key,
      required this.icondata,
      required this.label,
      required this.isActive})
      : super(key: key);
  final IconData icondata;
  final String label;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 50,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Row(
          children: [
            Icon(
              icondata,
              color: isActive
                  ? const Color(BuiltinColor.blue_gradient_01)
                  : Colors.black.withOpacity(0.8),
            ),
            const SizedBox(width: 5.0),
            Text(label, style: Design.textBody(isEnable: isActive, bold: true)),
          ],
        ),
      ),
    );
  }
}
