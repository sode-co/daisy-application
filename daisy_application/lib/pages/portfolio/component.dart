import 'package:daisy_application/pages/common/colors.dart';
import 'package:daisy_application/pages/common/responsive.dart';
import 'package:daisy_application/pages/common/style.dart';
import 'package:flutter/material.dart';

class PortfolioBody extends StatefulWidget {
  const PortfolioBody({Key? key}) : super(key: key);

  @override
  State<PortfolioBody> createState() => _PortfolioBodyState();
}

class _PortfolioBodyState extends State<PortfolioBody> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: const [
        CoverAndAvatar(),
        PortfolioTabBar(),
      ],
    );
  }
}

class PortfolioTabBar extends StatefulWidget {
  const PortfolioTabBar({
    Key? key,
  }) : super(key: key);

  @override
  State<PortfolioTabBar> createState() => _PortfolioTabBarState();
}

class _PortfolioTabBarState extends State<PortfolioTabBar>
    with TickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(color: Theme.of(context).primaryColor),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              border: Border.all(color: Colors.grey.shade100),
            ),
            child: TabBar(
              labelColor: Colors.black.withOpacity(0.6),
              indicatorColor:
                  const Color(BuiltinColor.blue_gradient_01).withOpacity(0.6),
              controller: _controller,
              tabs: const [
                Tab(
                  child: Text(
                    'Portfolio',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                Tab(
                  child: Text(
                    'About',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: size.height,
          child: TabBarView(
            controller: _controller,
            children: const <Widget>[
              PortfolioTab(),
              Text('About'),
            ],
          ),
        ),
      ],
    );
  }
}

class PortfolioTab extends StatefulWidget {
  const PortfolioTab({
    Key? key,
  }) : super(key: key);

  @override
  State<PortfolioTab> createState() => _PortfolioTabState();
}

class _PortfolioTabState extends State<PortfolioTab> {
  List<String> categories = [
    'Web & app design',
    'Logo & identity',
    'Business & advertising',
    'Clothing & merchandise',
    'Book & magazine',
    'Packaging & label',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 2.0),
            child: DropdownList(
              categories: categories,
              label: '',
            ),
          ),
        ],
      ),
    );
  }
}

class CoverAndAvatar extends StatelessWidget {
  const CoverAndAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(
      alignment: Alignment.topLeft,
      children: <Widget>[
        // background image and bottom contents
        SizedBox(
          width: size.width,
          height: Responsive.isDesktop(context)
              ? size.height * 0.4
              : size.height * 0.33,
          child: Column(
            children: <Widget>[
              Container(
                height: 200.0,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/portfolio/cover.jpg'),
                      fit: BoxFit.fill),
                ),
              ),
            ],
          ),
        ),
        // Profile image
        Positioned(
          top: 130.0,
          left: Responsive.isDesktop(context)
              ? 30.0
              : 10.0, // (background container size) - (circle height / 2)
          child: const SizedBox(
            height: 130.0,
            width: 130.0,
            child: CircleAvatar(
              backgroundImage:
                  NetworkImage('assets/images/portfolio/avatar.png'),
            ),
          ),
        ),
        Positioned(
          top: 205.0,
          left: Responsive.isDesktop(context)
              ? 170.0
              : 155.0, // (background container size) - (circle height / 2)
          child: SizedBox(
            height: 100.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Merci Dsgn',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
                const SizedBox(height: 2.0),
                Text(
                  'merci@gmail.com',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// After merge the https://github.com/sode-co/daisy-application/pull/69/files
// I will use dropdown list class of
// daisy_application/lib/pages/post-new-job/view/components.dart
class DropdownList extends StatefulWidget {
  const DropdownList({Key? key, required this.label, required this.categories})
      : super(key: key);
  final String label;
  final List<String> categories;

  @override
  State<DropdownList> createState() => _DropdownListState(label, categories);
}

class _DropdownListState extends State<DropdownList> {
  late String _label;
  late List<String> _categories;
  late String dropdownValue;
  _DropdownListState(label, categories) {
    _label = label;
    _categories = categories;
    dropdownValue = _categories[0];
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(_label, style: Style.stringText),
        SizedBox(
          width: size.width * 0.2,
          height: 50,
          child: InputDecorator(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: dropdownValue,
                icon: const Icon(Icons.expand_more),
                elevation: 16,
                style: Style.placeHolderText,
                onChanged: (String? newValue) {
                  setState(
                    () {
                      dropdownValue = newValue!;
                    },
                  );
                },
                items: _categories.map<DropdownMenuItem<String>>(
                  (String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  },
                ).toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
