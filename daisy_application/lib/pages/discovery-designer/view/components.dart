import 'package:daisy_application/pages/common/colors.dart';
import 'package:flutter/material.dart';

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
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.05, vertical: 70),
              child: Text(
                'Designers',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: size.width * 0.05),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              border: Border.all(color: Colors.grey.shade100),
            ),
            child: SizedBox(
              width: 350.0,
              child: TabBar(
                labelColor: Colors.black.withOpacity(0.6),
                indicatorColor:
                    const Color(BuiltinColor.blue_gradient_01).withOpacity(0.6),
                controller: _controller,
                tabs: const [
                  Tab(
                    child: Text(
                      'Liên lạc',
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
            children: const <Widget>[
              ContactTab(),
              FindNewDesignerTab(),
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
    return Text('Contact Tab');
  }
}

class FindNewDesignerTab extends StatefulWidget {
  const FindNewDesignerTab({Key? key}) : super(key: key);

  @override
  State<FindNewDesignerTab> createState() => _FindNewDesignerTabState();
}

class _FindNewDesignerTabState extends State<FindNewDesignerTab> {
  @override
  Widget build(BuildContext context) {
    return Text('FindNewDesignerTab');
  }
}
