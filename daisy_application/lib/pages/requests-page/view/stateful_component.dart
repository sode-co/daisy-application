import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PostedJob extends StatefulWidget {
  const PostedJob({Key? key}) : super(key: key);

  @override
  State<PostedJob> createState() => _PostedJobState();
}

class _PostedJobState extends State<PostedJob> {
  @override
  Widget build(BuildContext context) {
    return Text('Posted job');
  }
}
