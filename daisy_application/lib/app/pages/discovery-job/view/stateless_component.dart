import 'package:daisy_application/app/common/design/design.dart';
import 'package:daisy_application/common/constants.dart';
import 'package:daisy_application/core_services/models/request/request_model.dart';
import 'package:daisy_application/app/common/colors.dart';
import 'package:daisy_application/app/common/style.dart';
import 'package:flutter/material.dart';
import 'package:daisy_application/app/common/utils/widget_utils.dart';

class IntroJobCard extends StatelessWidget {
  final Function(RequestModel)? onItemSelected;
  const IntroJobCard({Key? key, required this.request, this.onItemSelected})
      : super(key: key);
  final RequestModel request;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: Design.itemSpacing),
      child: InkWell(
        onTap: onItemSelected == null ? null : () => onItemSelected!(request),
        child: SizedBox(
          width: context.isScreenType(ScreenType.DESKTOP) ? 400.0 : 380.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 60.0,
                width: 60.0,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    request.customer!.avatar!,
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
                      '${request.title}',
                      style: Design.textBodyBold(),
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  SizedBox(
                    width: 280,
                    child: Text(
                      request.description ?? '',
                      style: Design.textBody(),
                    ),
                  ),
                  SizedBox(
                    width: 280,
                    child: Text(
                      '',
                      style: Design.textBody(),
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
                        request.status ?? '',
                        style: Design.textBody(),
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
      ),
    );
  }
}

class _DisplayTime {
  final String name;
  final int number;

  _DisplayTime(this.name, this.number);

  @override
  String toString() => '$number $name ago';
}

class JobDetails extends StatelessWidget {
  final VoidCallback? onApply;
  const JobDetails({Key? key, required this.request, this.onApply})
      : super(key: key);
  final RequestModel request;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    _DisplayTime displayTime;

    double weeksCount = ((DateTime.now().millisecondsSinceEpoch -
            request.createdAt!.millisecondsSinceEpoch) /
        (1000 * 60 * 60 * 24) /
        7);

    if (weeksCount > 1) {
      displayTime = _DisplayTime('weeks', weeksCount.toInt());
    } else if (weeksCount * 7 > 1) {
      displayTime = _DisplayTime('days', (weeksCount * 7).toInt());
    } else {
      displayTime = _DisplayTime('hours', (weeksCount * 7 * 24).toInt());
    }

    return Padding(
      padding: const EdgeInsets.only(top: Design.headerSpacing),
      child: SizedBox(
        width: size.width * 0.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: size.width * 0.8,
              child: Text(
                request.title ?? '',
                style: Design.textTitle(),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(' ', style: Design.textBody()),
                Text(
                  displayTime.toString(),
                  style: Style.lightSmallString,
                ),
              ],
            ),
            const SizedBox(height: Design.bodySpacing),
            Row(
              children: const [
                Icon(Icons.work_outline),
                SizedBox(width: Design.contentSpacing),
                Text('Freelance'),
              ],
            ),
            Row(
              children: const [
                Icon(Icons.tips_and_updates_outlined),
                SizedBox(width: Design.contentSpacing),
                Text('You match this job')
              ],
            ),
            const SizedBox(height: Design.headerSpacing),
            ApplicationButton(onApply: onApply),
            const SizedBox(height: Design.headerSpacing),
            Text(
              'Phân loại:',
              style: Design.textHeadline(),
            ),
            const SizedBox(height: Design.contentSpacing),
            Text(
              request.category!.name!,
              style: Design.textBody(),
            ),
            const SizedBox(height: Design.headerSpacing),
            Text(
              'Mô tả chi tiết:',
              style: Design.textHeadline(),
            ),
            const SizedBox(height: Design.contentSpacing),
            Text(
              request.description!,
              style: Design.textBody(),
            ),
            const SizedBox(height: Design.headerSpacing),
            Text(
              'Thông tin người tuyển dụng',
              style: Design.textHeadline(),
            ),
            const SizedBox(height: Design.contentSpacing),
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
        width: double.infinity,
        height: 100,
        child: Padding(
          padding: const EdgeInsets.only(left: Design.contentSpacing),
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: double.infinity,
                  width: 80.0,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      request.customer?.avatar ?? '',
                    ),
                  ),
                ),
                const SizedBox(width: Design.contentSpacing),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        request.customer?.displayName ?? '',
                        style: Design.textBodyLarge(bold: true),
                      ),
                      const SizedBox(
                        height: Design.contentSpacing,
                      ),
                      Text(
                        request.customer?.email ?? '',
                        style: Design.textBody(),
                      ),
                      const SizedBox(
                        height: Design.contentSpacing,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ApplicationButton extends StatelessWidget {
  final VoidCallback? onApply;
  const ApplicationButton({
    Key? key,
    this.onApply,
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
          onPressed: onApply,
        ),
      ),
    );
  }
}
