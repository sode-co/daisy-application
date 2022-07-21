import 'package:daisy_application/app/common/design/design.dart';
import 'package:daisy_application/app/common/responsive.dart';
import 'package:daisy_application/app/common/widget/bottom_nav/bottomnavbar.dart';
import 'package:daisy_application/app/common/widget/header/header.dart';
import 'package:daisy_application/app/pages/find-designer/model/find_designer_page_state.dart';
import 'package:daisy_application/app/pages/find-designer/view/find_designer_body.dart';
import 'package:daisy_application/app/pages/find-designer/view/find_designer_header.dart';
import 'package:daisy_application/app/pages/portfolio/deps/portfolio_listener.dart';
import 'package:daisy_application/app_state/application_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FindDesignerPage extends StatefulWidget {
  const FindDesignerPage({Key? key}) : super(key: key);

  @override
  State<FindDesignerPage> createState() => FindDesignerPageState();
}

class FindDesignerPageState extends State<FindDesignerPage> {
  @override
  initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  ApplicationState get appState => context.read();
  FindDesigneScreenState get screenState => context.watch();
  PortfolioListener get listener => context.findAncestorStateOfType()!;

  @override
  Widget build(BuildContext context) {
    context.watch<FindDesigneScreenState>();
    return DefaultTabController(
      initialIndex: 0,
      length: 1,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
                backgroundColor: Design.headerColor,
                floating: true,
                snap: true,
                pinned: true,
                flexibleSpace: DecoratedBox(
                  decoration: const BoxDecoration(color: Colors.white),
                  child: FlexibleSpaceBar(
                    collapseMode: CollapseMode.parallax,
                    background: Container(
                      color: Colors.white,
                      child: const Header(color: Design.headerColor),
                    ),
                  ),
                ),
                leadingWidth: double.infinity,
                bottom: createBodyAndTabar())
          ],
          body: Container(
            padding: EdgeInsets.symmetric(
                horizontal: Design.alignmentSpacing(context),
                vertical: Design.headerSpacing),
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                createFindDesignerTab(),
              ],
            ),
          ),
        ),
        bottomNavigationBar:
            !Responsive.isDesktop(context) ? const BottomNavBar() : null,
      ),
    );
  }

  PreferredSize createBodyAndTabar() => PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight + 130),
        child: Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(
              vertical: 10, horizontal: Design.alignmentSpacing(context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: Design.bodySpacing),
              createHeader(),
              const SizedBox(height: Design.contentSpacing),
              Responsive.isDesktop(context)
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        if (Responsive.isDesktop(context))
                          Container(
                            alignment: Alignment.topLeft,
                            height: 25,
                            width: 5,
                            color: Design.colorPrimary,
                          ),
                        createTabBar()
                      ],
                    )
                  : createTabBar(),
            ],
          ),
        ),
      );

  Widget createTabBar() {
    return TabBar(
      isScrollable: !Responsive.isMobile(context),
      indicatorColor: Design.colorBlack,
      indicatorWeight: 5,
      indicatorPadding: const EdgeInsets.symmetric(horizontal: 20),
      tabs: [
        createTab('Tìm kiếm'),
      ],
    );
  }

  Widget createTab(String title) => Container(
        alignment: Alignment.centerLeft,
        child: Tab(
            icon: Text(title,
                textAlign: TextAlign.start,
                style: Design.textBodyFold(
                    isMobile: !Responsive.isDesktop(context)))),
      );

  Widget buildTestBody(String text) => ListView.separated(
        itemBuilder: (ctx, index) => Text(
          'Item $index',
          style: Design.textTitle(),
        ),
        separatorBuilder: (ctx, index) => const SizedBox(height: 30),
        itemCount: 25,
      );
}
