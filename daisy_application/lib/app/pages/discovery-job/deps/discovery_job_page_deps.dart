import 'package:flutter/material.dart';

abstract class DiscoveryJobListener<T extends StatefulWidget>
    implements State<T> {
  void onLoadMoreRequest();
}
