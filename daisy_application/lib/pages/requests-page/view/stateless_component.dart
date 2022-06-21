import 'package:daisy_application/core_services/models/request/request_model.dart';
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

class InfoJobCard extends StatelessWidget {
  const InfoJobCard({Key? key, required this.request}) : super(key: key);
  final RequestModel request;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: SizedBox(
        width: 950,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 60.0,
              width: 60.0,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  request.user!.avatar.toString(),
                ),
              ),
            ),
            const SizedBox(width: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 850,
                  child: Text(
                    request.title.toString(),
                    style: const TextStyle(
                      color: Color(BuiltinColor.blue_gradient_01),
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                SizedBox(
                  width: 280,
                  child: Text(
                    request.user!.displayName!,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  width: 280,
                  child: Text(
                    request.user!.address!,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  'Categories:',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 2.0,
                ),
                Row(
                  children: const [
                    Text('Logo'),
                    Text(', '),
                    Text('Motion graphic'),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  'Description:',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 2.0,
                ),
                SizedBox(
                  width: 850,
                  child: Text(request.description!),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Container(
                  color: Colors.grey.withOpacity(0.6),
                  child: const SizedBox(width: 600, height: 1.0),
                ),
                const SizedBox(
                  height: 18.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
