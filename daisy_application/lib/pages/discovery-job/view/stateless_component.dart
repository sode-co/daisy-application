import 'package:daisy_application/core_services/models/request/request_model.dart';
import 'package:daisy_application/pages/common/colors.dart';
import 'package:flutter/material.dart';

class IntroJobCard extends StatelessWidget {
  const IntroJobCard({Key? key, required this.img, required this.request})
      : super(key: key);
  final String img;
  final RequestModel request;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 80.0,
            width: 80.0,
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
                width: 250,
                child: Text(
                  request.title.toString(),
                  style: const TextStyle(
                    color: Color(BuiltinColor.blue_gradient_01),
                    fontSize: 17.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              SizedBox(
                width: 250,
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
                width: 250,
                child: Text(
                  request.user!.address!,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.7),
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Row(
                children: [
                  const Icon(Icons.explore, color: Colors.green),
                  const SizedBox(
                    width: 2.0,
                  ),
                  Text(
                    'Đang tuyển',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5.0,
              ),
              Container(
                color: Colors.grey.withOpacity(0.3),
                child: const SizedBox(width: 300, height: 1.0),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
