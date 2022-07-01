// ignore_for_file: unnecessary_const

import 'package:daisy_application/app/common/colors.dart';
import 'package:daisy_application/app/common/responsive.dart';
import 'package:flutter/material.dart';

class ProjectDetailsBody extends StatefulWidget {
  const ProjectDetailsBody({Key? key}) : super(key: key);

  @override
  State<ProjectDetailsBody> createState() => _ProjectDetailsBodyState();
}

class _ProjectDetailsBodyState extends State<ProjectDetailsBody>
    with TickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: 3,
      vsync: this,
      initialIndex: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            border: const Border(
              bottom: BorderSide(
                color: const Color(BuiltinColor.blue_gradient_01),
              ),
            ),
          ),
          child: SizedBox(
            width: size.width,
            height: 160,
            child: Padding(
              padding: EdgeInsets.only(
                left: Responsive.isDesktop(context) ? 60.0 : 70.0,
                top: 10.0,
              ),
              child: Row(
                children: [
                  Image.asset('assets/images/project_details.png'),
                  const SizedBox(width: 12.0),
                  Text(
                    'Chi tiết dự án',
                    style: TextStyle(
                      fontSize: Responsive.isDesktop(context) ? 25.0 : 21.0,
                      fontWeight: FontWeight.w600,
                      color: const Color(BuiltinColor.blue_gradient_01),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 0.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              border: Border.all(color: Colors.grey.shade100),
            ),
            child: SizedBox(
              width: Responsive.isDesktop(context) ? 800.0 : size.width,
              child: TabBar(
                labelColor: Colors.black.withOpacity(0.6),
                indicatorColor:
                    const Color(BuiltinColor.blue_gradient_01).withOpacity(0.6),
                controller: _controller,
                tabs: const [
                  Tab(
                    child: Text(
                      'Các đầu việc cụ thể',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Danh sách ứng viên đã ứng tuyển',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Thảo luận',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: size.height,
          child: TabBarView(
            controller: _controller,
            children: const <Widget>[
              Text('Đầu việc'),
              Text('Danh sách ứng viên'),
              Text('Thảo luận'),
            ],
          ),
        ),
      ],
    );
  }
}
