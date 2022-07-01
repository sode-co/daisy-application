import 'package:flutter/material.dart';

class CustomizedBadge extends StatelessWidget {
  final double bottom;
  final double left;
  final Widget child; // our badge widget will wrap this child widget
  final Widget badge; // what displays inside the badge
  final Color color; // the  background color of the badge - default is red

  const CustomizedBadge(
      {Key? key,
      required this.child,
      required this.badge,
      this.color = Colors.red,
      required this.bottom,
      required this.left})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
          left: left,
          bottom: bottom,
          child: Container(
            padding: const EdgeInsets.all(2.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: color,
            ),
            constraints: const BoxConstraints(
              minWidth: 16,
              minHeight: 16,
            ),
            child: badge,
          ),
        )
      ],
    );
  }
}
