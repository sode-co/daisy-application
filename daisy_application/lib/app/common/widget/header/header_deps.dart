import 'package:flutter/material.dart';

abstract class HeaderNavigationListener<T extends StatefulWidget>
    implements State<T> {
  void onBtnJobPostClicked() {}
  void onBtnFindDesignerClicked() {}
  void onBtnFindJobCliked() {}
}

abstract class HeaderAuthenticationListener<T extends StatefulWidget>
    implements State<T> {
  void onBtnSignupClicked() {}
  void onBtnSigninClicked() {}
  void onBtnSignoutClicked() {}
}
