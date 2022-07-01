import 'package:daisy_application/app/common/colors.dart';
import 'package:daisy_application/app/common/responsive.dart';
import 'package:daisy_application/app/pages/discovery-designer/model/category.dart';
import 'package:daisy_application/app/pages/discovery-designer/view/category_side_bar.dart';
import 'package:daisy_application/app/pages/discovery-designer/view/stateless_components.dart';
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
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: <Color>[Colors.blue, Colors.white],
            ),
          ),
          child: SizedBox(
            width: size.width,
            height: 160,
            child: Padding(
              padding: EdgeInsets.only(
                left: Responsive.isDesktop(context) ? 60.0 : 70.0,
                top: 70.0,
              ),
              child: Text(
                'Workspace',
                style: TextStyle(
                  fontSize: Responsive.isDesktop(context) ? 25.0 : 21.0,
                  fontWeight: FontWeight.w800,
                  color: Colors.white.withOpacity(0.9),
                ),
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
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 12.0),
                  child: AutocompleteBasic(),
                ),
                ChangeNotifierProvider<CategoriesPageModel>(
                  create: (context) => CategoriesPageModel(),
                  child: CategoriesPageComponent.renderCategoriesCheckbox(),
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
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 12.0),
                child: AutocompleteBasic(),
              ),
              ChangeNotifierProvider<CategoriesPageModel>(
                create: (context) => CategoriesPageModel(),
                child: CategoriesPageComponent.renderCategoriesCheckbox(),
              ),
              const DesignerInfoCardMobile(),
              const DesignerInfoCardMobile(),
              const DesignerInfoCardMobile(),
              const DesignerInfoCardMobile(),
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
            bottom: Responsive.isDesktop(context) ? 600.0 : 450, left: 10.0),
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
            bottom: Responsive.isDesktop(context) ? 600.0 : 450, left: 10.0),
        child: SizedBox(
          width: Responsive.isDesktop(context)
              ? size.width * 0.7
              : size.width * 0.7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SearchByNameTextField(),
              SizedBox(height: 10.0),
              NoActiveProjectInfo(),
            ],
          ),
        ),
      ),
    );
  }
}
