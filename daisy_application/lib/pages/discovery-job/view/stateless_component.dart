import 'package:daisy_application/core_services/models/request/request_model.dart';
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
      height: 300,
      child: Row(
        children: [
          Image.asset(img),
          Column(
            children: [
              Text(
                request.title.toString(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
