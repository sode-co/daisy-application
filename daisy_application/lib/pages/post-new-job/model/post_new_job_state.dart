import 'package:flutter/material.dart';

class PostNewJobState with ChangeNotifier {
  String title = '';
  List<String> categories = [];
  String description = '';
}
