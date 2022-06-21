import 'package:daisy_application/pages/common/colors.dart';
import 'package:flutter/material.dart';

class LabelAndIcon extends StatelessWidget {
  const LabelAndIcon(
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
            Text(
              label,
              style: TextStyle(
                color: isActive
                    ? const Color(BuiltinColor.blue_gradient_01)
                    : Colors.black.withOpacity(0.8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
