import 'package:daisy_application/core_services/models/request/request_model.dart';
import 'package:daisy_application/pages/common/colors.dart';
import 'package:daisy_application/pages/common/responsive.dart';
import 'package:daisy_application/pages/common/style.dart';
import 'package:flutter/material.dart';

class IntroJobCard extends StatelessWidget {
  const IntroJobCard({Key? key, required this.request}) : super(key: key);
  final RequestModel request;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: SizedBox(
        width: Responsive.isDesktop(context) ? 400.0 : 380.0,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 60.0,
              width: 60.0,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  ' ',
                ),
              ),
            ),
            const SizedBox(width: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 300,
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
                    ' ',
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
                    ' ',
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
                Row(
                  children: [
                    const Icon(Icons.event_available, color: Colors.green),
                    const SizedBox(
                      width: 2.0,
                    ),
                    Text(
                      'Đang tuyển',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.7),
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 2.0,
                ),
                Container(
                  color: Colors.grey.withOpacity(0.3),
                  child: const SizedBox(width: 300, height: 1.0),
                ),
                const SizedBox(
                  height: 5.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class JobDetails extends StatelessWidget {
  const JobDetails({Key? key, required this.request}) : super(key: key);
  final RequestModel request;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: SizedBox(
        width: size.width * 0.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: size.width * 0.8,
              child: Text(
                request.title.toString(),
                style: TextStyle(
                  color: Colors.black.withOpacity(0.8),
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  ' ',
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.7),
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 10.0),
                Text(
                  '3 weeks ago',
                  style: Style.lightSmallString,
                ),
                Text(
                  ' • ',
                  style: Style.lightSmallString,
                ),
                Text(
                  '33 applications',
                  style: Style.lightSmallString,
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Row(
              children: const [
                Icon(Icons.work_outline),
                SizedBox(width: 10.0),
                Text('Freelance'),
              ],
            ),
            Row(
              children: const [
                Icon(Icons.how_to_reg_outlined),
                SizedBox(width: 10.0),
                Text('100 completed jobs'),
              ],
            ),
            Row(
              children: const [
                Icon(Icons.tips_and_updates_outlined),
                SizedBox(width: 10.0),
                Text('You match this job'),
              ],
            ),
            const SizedBox(height: 20.0),
            const ApplicationButton(),
            const SizedBox(height: 20.0),
            const Text(
              'Phân loại:',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 5.0),
            Text(
              request.category!.name!,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 15.0),
            const Text(
              'Mô tả chi tiết:',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 5.0),
            Text(
              request.description!,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 15.0),
            const Text(
              'Thông tin người tuyển dụng',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 5.0),
            RecruiterInfo(request: request)
          ],
        ),
      ),
    );
  }
}

class RecruiterInfo extends StatelessWidget {
  const RecruiterInfo({
    Key? key,
    required this.request,
  }) : super(key: key);

  final RequestModel request;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade200,
        ),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: SizedBox(
        width: 500,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 80.0,
                width: 80.0,
                child: const CircleAvatar(
                  backgroundImage: NetworkImage(
                    ' ',
                  ),
                ),
              ),
              const SizedBox(width: 10.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 300,
                    child: Text(
                      ' ',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  SizedBox(
                    width: 280,
                    child: Text(
                      ' ',
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
                      '100 completed jobs',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.7),
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ApplicationButton extends StatelessWidget {
  const ApplicationButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(BuiltinColor.blue_gradient_01),
        ),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: SizedBox(
        width: 200.0,
        height: 50.0,
        child: TextButton.icon(
          icon: const Icon(
            Icons.approval,
            color: Color(BuiltinColor.blue_gradient_01),
          ),
          label: const Text(
            'Ứng tuyển ngay',
            style: TextStyle(
              color: Color(BuiltinColor.blue_gradient_01),
            ),
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
