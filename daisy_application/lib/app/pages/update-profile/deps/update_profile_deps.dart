import 'package:flutter/material.dart';

abstract class UpdateProfileListener<T extends StatefulWidget>
    implements State<T> {
  void onBtnUpdateProfileClicked() {}
}
