import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DiscoverDesigner extends StatefulWidget {
  const DiscoverDesigner({Key? key}) : super(key: key);

  @override
  State<DiscoverDesigner> createState() => _DiscoverDesignerState();
}

class _DiscoverDesignerState extends State<DiscoverDesigner> {
  @override
  Widget build(BuildContext context) {
    return Text('Find designer');
  }
}
