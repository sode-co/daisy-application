// ignore_for_file: unnecessary_const

import 'package:auto_route/auto_route.dart';
import 'package:daisy_application/app/common/colors.dart';
import 'package:daisy_application/app/common/design/design_style.dart';
import 'package:daisy_application/app/common/responsive.dart';
import 'package:daisy_application/app/pages/discovery-designer/view/category_side_bar.dart';
import 'package:daisy_application/app/pages/discovery-designer/view/stateless_components.dart';
import 'package:daisy_application/app/pages/project-details/model/project_details_state.dart';
import 'package:daisy_application/app/router/router.gr.dart' as Routers;
import 'package:daisy_application/core_services/models/request/request_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DiscoverDesignerBody extends StatefulWidget {
  const DiscoverDesignerBody({Key? key}) : super(key: key);

  @override
  State<DiscoverDesignerBody> createState() => _DiscoverDesignerBodyState();
}

class _DiscoverDesignerBodyState extends State<DiscoverDesignerBody>
    with TickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: 2,
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
                  Image.asset('assets/images/workspace.png'),
                  const SizedBox(width: 12.0),
                  Text(
                    'Workspace',
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
              width: Responsive.isDesktop(context) ? 430.0 : size.width,
              child: TabBar(
                labelColor: Colors.black.withOpacity(0.6),
                indicatorColor:
                    const Color(BuiltinColor.blue_gradient_01).withOpacity(0.6),
                controller: _controller,
                tabs: const [
                  Tab(
                    child: Text(
                      'Dự án và liên lạc',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Tìm designers mới',
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
            children: <Widget>[
              const ContactTab(),
              Responsive.isDesktop(context)
                  ? const FindNewDesignerTabWeb()
                  : const FindNewDesignerTabMobile(),
            ],
          ),
        ),
      ],
    );
  }
}

class ContactTab extends StatefulWidget {
  const ContactTab({Key? key}) : super(key: key);

  @override
  State<ContactTab> createState() => _ContactTabState();
}

class _ContactTabState extends State<ContactTab> {
  @override
  Widget build(BuildContext context) {
    return const ContactSideBar();
  }
}

class FindNewDesignerTabWeb extends StatefulWidget {
  const FindNewDesignerTabWeb({Key? key}) : super(key: key);

  @override
  State<FindNewDesignerTabWeb> createState() => _FindNewDesignerTabWebState();
}

class _FindNewDesignerTabWebState extends State<FindNewDesignerTabWeb> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.isDesktop(context) ? 70.0 : 10.0,
        vertical: Responsive.isDesktop(context) ? 20.0 : 10.0,
      ),
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 12.0),
                  child: AutocompleteBasic(),
                ),
              ],
            ),
            SingleChildScrollView(
              child: Column(
                children: const [
                  DesignerInfoCardWeb(),
                  DesignerInfoCardWeb(),
                  DesignerInfoCardWeb(),
                  DesignerInfoCardWeb(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FindNewDesignerTabMobile extends StatefulWidget {
  const FindNewDesignerTabMobile({Key? key}) : super(key: key);

  @override
  State<FindNewDesignerTabMobile> createState() =>
      _FindNewDesignerTabMobileState();
}

class _FindNewDesignerTabMobileState extends State<FindNewDesignerTabMobile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Responsive.isDesktop(context) ? 70.0 : 10.0,
          vertical: Responsive.isDesktop(context) ? 20.0 : 10.0,
        ),
        child: SizedBox(
          width: size.width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 12.0),
                child: AutocompleteBasic(),
              ),
              SizedBox(width: Responsive.isDesktop(context) ? 50.0 : 10.0),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, top: 0.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: const [
                      DesignerInfoCardMobile(),
                      DesignerInfoCardMobile(),
                      DesignerInfoCardMobile(),
                      DesignerInfoCardMobile(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ContactSideBar extends StatefulWidget {
  const ContactSideBar({Key? key}) : super(key: key);

  @override
  State<ContactSideBar> createState() => _ContactSideBarState();
}

class _ContactSideBarState extends State<ContactSideBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
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
                      icondata: Icons.list,
                      isActive: false,
                      label: 'Tất cả liên lạc',
                    )
                  : const Tooltip(
                      message: 'Tất cả liên lạc',
                      child: Icon(Icons.list),
                    ),
              selectedIcon: Responsive.isDesktop(context)
                  ? const LabelAndIcon(
                      icondata: Icons.list,
                      isActive: true,
                      label: 'Tất cả liên lạc',
                    )
                  : const Tooltip(
                      message: 'Tất cả liên lạc',
                      child: Icon(Icons.list),
                    ),
              label: const SizedBox(height: 0),
            ),
            NavigationRailDestination(
              icon: Responsive.isDesktop(context)
                  ? const LabelAndIcon(
                      icondata: Icons.local_mall_outlined,
                      isActive: false,
                      label: 'Dự án đang hoạt động',
                    )
                  : const Tooltip(
                      message: 'Dự án đang hoạt động',
                      child: Icon(Icons.local_mall_outlined),
                    ),
              selectedIcon: Responsive.isDesktop(context)
                  ? const LabelAndIcon(
                      icondata: Icons.local_mall_outlined,
                      isActive: true,
                      label: 'Dự án đang hoạt động',
                    )
                  : const Tooltip(
                      message: 'Dự án đang hoạt động',
                      child: Icon(Icons.local_mall_outlined),
                    ),
              label: const SizedBox(height: 0),
            ),
            NavigationRailDestination(
              icon: Responsive.isDesktop(context)
                  ? const LabelAndIcon(
                      icondata: Icons.cases_outlined,
                      isActive: false,
                      label: 'Tất cả dự án',
                    )
                  : const Tooltip(
                      message: 'Tất cả dự án',
                      child: Icon(Icons.cases_outlined),
                    ),
              selectedIcon: Responsive.isDesktop(context)
                  ? const LabelAndIcon(
                      icondata: Icons.cases_outlined,
                      isActive: true,
                      label: 'Tất cả dự án',
                    )
                  : const Tooltip(
                      message: 'Tất cả dự án',
                      child: Icon(Icons.cases_outlined),
                    ),
              label: const SizedBox(height: 0),
            ),
          ],
        ),
        const VerticalDivider(thickness: 1, width: 1),
        // This is the main content.
        if (_selectedIndex == 0) const MyContact(),
        if (_selectedIndex == 1) const ActiveProject(),
        if (_selectedIndex == 2) const ActiveProject(),
      ],
    );
  }
}

class MyContact extends StatefulWidget {
  const MyContact({Key? key}) : super(key: key);

  @override
  State<MyContact> createState() => _MyContactState();
}

class _MyContactState extends State<MyContact> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
            bottom: Responsive.isDesktop(context) ? 600.0 : 450, left: 30.0),
        child: SizedBox(
          width: Responsive.isDesktop(context)
              ? size.width * 0.7
              : size.width * 0.7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SearchByNameTextField(),
              SizedBox(height: 10.0),
              NoContactInfo(),
            ],
          ),
        ),
      ),
    );
  }
}

class ActiveProject extends StatefulWidget {
  const ActiveProject({Key? key}) : super(key: key);

  @override
  State<ActiveProject> createState() => _ActiveProjectState();
}

class _ActiveProjectState extends State<ActiveProject> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
            bottom: Responsive.isDesktop(context) ? 600.0 : 450, left: 30.0),
        child: SizedBox(
          width: Responsive.isDesktop(context)
              ? size.width * 0.8
              : size.width * 0.7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SearchByNameTextField(),
              SizedBox(height: 10.0),
              ProjectList(),
            ],
          ),
        ),
      ),
    );
  }
}

class ProjectList extends StatefulWidget {
  const ProjectList({Key? key}) : super(key: key);

  @override
  State<ProjectList> createState() => _ProjectListState();
}

class _ProjectListState extends State<ProjectList> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    List projectList = [
      RequestModel.init()
        ..title = 'Project 01'
        ..description =
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
        ..budget = 1000000.0
        ..timeline = DateTime.now()
        ..status = 'Available'
        ..items = [
          RequestModel.init()
            ..title = 'Project child 01'
            ..description =
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
            ..budget = 1000000.0
            ..timeline = DateTime.now()
            ..items = [],
          RequestModel.init()
            ..title = 'Project child 02'
            ..description =
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
            ..budget = 1000000.0
            ..timeline = DateTime.now()
            ..items = [],
        ],
      RequestModel.init()
        ..title = 'Project 01'
        ..description =
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
        ..budget = 1000000.0
        ..timeline = DateTime.now()
        ..status = 'Available'
        ..items = [
          RequestModel.init()
            ..title = 'Project child 01'
            ..description =
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
            ..budget = 1000000.0
            ..timeline = DateTime.now()
            ..items = [],
          RequestModel.init()
            ..title = 'Project child 02'
            ..description =
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
            ..budget = 1000000.0
            ..timeline = DateTime.now()
            ..items = [],
        ],
      RequestModel.init()
        ..title = 'Project 01'
        ..description =
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
        ..budget = 1000000.0
        ..timeline = DateTime.now()
        ..status = 'Available'
        ..items = [
          RequestModel.init()
            ..title = 'Project child 01'
            ..description =
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
            ..budget = 1000000.0
            ..timeline = DateTime.now()
            ..items = [],
          RequestModel.init()
            ..title = 'Project child 02'
            ..description =
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
            ..budget = 1000000.0
            ..timeline = DateTime.now()
            ..items = [],
        ],
    ];

    return SizedBox(
      width: size.width * 0.7,
      height: 2000.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: projectList
            .map(
              (request) => ProjectInfoCard(request: request),
            )
            .toList(),
      ),
    );
  }
}

class ProjectInfoCard extends StatefulWidget {
  const ProjectInfoCard({Key? key, required this.request}) : super(key: key);
  final RequestModel request;
  @override
  State<ProjectInfoCard> createState() => _ProjectInfoCardState(request);
}

class _ProjectInfoCardState extends State<ProjectInfoCard> {
  final RequestModel request;
  Function(RequestModel request)? onItemSelected;

  _ProjectInfoCardState(this.request);
  @override
  Widget build(BuildContext context) {
    var model = context.watch<ProjectDetailsState>();

    return InkWell(
      onTap: () {
        model.request = request;
        context.router.push(
          const Routers.ProjectDetailsRoute(),
        );
      },
      child: ProjectJobCard(
        request: request,
      ),
    );
  }
}

class ProjectJobCard extends StatelessWidget {
  const ProjectJobCard({Key? key, required this.request}) : super(key: key);
  final RequestModel request;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(top: Design.itemSpacing),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(
            color: Colors.black26,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(Design.itemSpacing),
          child: SizedBox(
            width: size.width * 0.9,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.width * 0.05,
                  width: size.width * 0.05,
                  child: const CircleAvatar(
                    backgroundImage: NetworkImage(
                      'assets/images/portfolio/avatar.png',
                    ),
                  ),
                ),
                const SizedBox(width: 15.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 550,
                      child: Text(
                        '${request.title}',
                        style: Design.textBodyBold(),
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    SizedBox(
                      width: size.width * 0.5,
                      child: Text(
                        request.description ?? '',
                        style: Design.textBody(),
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    SizedBox(
                      width: 500,
                      child: Text(
                        'Thời gian: ${request.timeline}',
                        style: Design.textBody(),
                      ),
                    ),
                    SizedBox(
                      width: 500,
                      child: Text(
                        'Ngân sách: ${request.budget.toString()}',
                        style: Design.textBody(),
                      ),
                    ),
                    SizedBox(
                      width: 500,
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
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
