import 'package:daisy_application/app/common/design/design.dart';
import 'package:daisy_application/app/common/responsive.dart';
import 'package:daisy_application/app/common/widget/bottom_nav/bottomnavbar.dart';
import 'package:daisy_application/app/common/widget/header/header.dart';
import 'package:daisy_application/app/pages/portfolio/deps/portfolio_listener.dart';
import 'package:daisy_application/app/pages/portfolio/model/portfolio_state.dart';
import 'package:daisy_application/app/pages/portfolio/view/portfolio_header.dart';
import 'package:daisy_application/app_state/application_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({Key? key}) : super(key: key);

  @override
  State<PortfolioPage> createState() => PortfolioPageState();
}

class PortfolioPageState extends State<PortfolioPage> {
  late PageController filePageController;
  late ScrollController? discussionScrollController;
  late TextEditingController discussionTextController;

  @override
  initState() {
    super.initState();
  }

  @override
  void dispose() {
    discussionTextController.dispose();
    discussionScrollController!.dispose();
    super.dispose();
  }

  ApplicationState get appState => context.read();
  PortfolioState get screenState => context.read();
  PortfolioListener get listener => context.findAncestorStateOfType()!;

  @override
  Widget build(BuildContext context) {
    context.watch<PortfolioState>();
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
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
                createPortfolioTab(),
                createContactTab(),
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
        createTab('Portfolio'),
        createTab('Liên lạc'),
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

  Widget createPortfolioTab() {
    return const Text('Portfolio');
  }

  Widget createContactTab() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.purple,
                  Colors.pinkAccent,
                ],
              ),
            ),
            child: const Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(
                      'https://firebasestorage.googleapis.com/v0/b/test-37ba6.appspot.com/o/Cat03.jpg?alt=media&token=143bae7b-74d9-44d5-a73f-4eb1ba3fc1ab'),
                ),
              ),
            ),
          ),
          Center(
              child: Text(
            'Ngoc Neeee',
            style: Design.textBody(),
          )),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                  onPressed: () async {
                    final Uri _url = Uri.parse(
                        'https://www.linkedin.com/in/ngoc-phan-thieu-856259128/');
                    await launchUrl(_url);
                  },
                  child: Text(
                    'Linkedin',
                    style: Design.textBody(),
                  )),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                  onPressed: () async {
                    //Call to launch email
                    final Uri emailLaunchUri = Uri(
                      scheme: 'mailto',
                      path: screenState.portfolio?.freelancer?.email ??
                          'ptngoc22@gmail.com',
                    );
                    await launchUrl(emailLaunchUri);
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.add,
                        size: 16,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Thêm liên lạc',
                        style: Design.textBody(textColor: Colors.white),
                      )
                    ],
                  ))
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: MediaQuery.of(context).size.width > 1200
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Experience',
                                style: Design.textSmallHeadline(),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
                                style: Design.textBody(),
                              ),
                              const Divider(),
                              Text(
                                'About Me',
                                style: Design.textSmallHeadline(),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                screenState
                                        .portfolio?.freelancer?.description ??
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
                                style: Design.textBody(),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Column(
                            children: [
                              Card(
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 40),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Location',
                                          style: Design.textCaption(),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.chevron_right,
                                              size: 14,
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Flexible(
                                              child: Text(
                                                screenState.portfolio
                                                        ?.freelancer?.address ??
                                                    '123 Main Street, New York, NY 10030',
                                                style: Design.textBody(),
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'Biography',
                                          style: Design.textCaption(),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.chevron_right,
                                              size: 14,
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Flexible(
                                              child: Text(
                                                screenState
                                                        .portfolio?.biography ??
                                                    'Loremp was born into such wealth and privilege that her family inspired the phrase ‘keeping up with the Joneses',
                                                style: Design.textBody(),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'Email',
                                          style: Design.textCaption(),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.chevron_right,
                                              size: 14,
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Flexible(
                                                child: Text(
                                              screenState.portfolio?.freelancer
                                                      ?.email ??
                                                  'ptnngoc22@gmail.com',
                                              style: Design.textBody(),
                                            )),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            const Icon(
                                              Icons.launch,
                                              size: 16,
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                      ]),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Experience",
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('''
Hello I am a freelancer

He has previously been a speaker at the Flutter Global Summit'21, Flutter Vikings and events across colleges, universities (like VIT Chennai, Vellore, MIT-ADT), and clubs (IEEE APSIT, SFIT, GirlScript, GeeksforGeeks Student Chapter, Google CrowdSource, and more) here in India.
'''),
                            Divider(),
                            Text(
                              "About Me",
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('''
Aditya is a content creator and has over 5K subscribers on YouTube and a 700+ member community on Discord.
📺 YouTube Channel: watch.adityathakur.in
🚀 Discord Community: discord.adityathakur.in
'''),
                          ],
                        ),
                        Column(
                          children: [
                            Card(
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 40),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Location",
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: const [
                                          Icon(
                                            Icons.circle,
                                            size: 16,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "Dharamshala, India",
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                        "Website",
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: const [
                                          Text("adityathakur.in"),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Icon(
                                            Icons.launch,
                                            size: 16,
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Portfolio",
                                        style: Design.textBody(),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: const [
                                          Text('Portfolio neeeee'),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Icon(
                                            Icons.launch,
                                            size: 16,
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Email",
                                        style: Design.textBody(),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: const [
                                          Text('portfolio'),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Icon(
                                            Icons.launch,
                                            size: 16,
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ]),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
