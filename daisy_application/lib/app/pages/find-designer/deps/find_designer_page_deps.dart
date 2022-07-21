import 'package:flutter/material.dart';

abstract class FindDesignerListener<T extends StatefulWidget>
    implements State<T> {
  void onSearchDesignersByCategoryId(int id);
}
