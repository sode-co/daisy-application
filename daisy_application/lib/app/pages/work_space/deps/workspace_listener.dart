import 'package:flutter/material.dart';

abstract class WorkSpaceListener<T extends StatefulWidget> implements State<T> {
  Future<void> onSelectedTabChanged(int tabIndex);
}
