import 'package:flutter/material.dart';

abstract class HeaderNavigationListener<T extends StatefulWidget>
    implements State<T> {
  void onBtnJobPostClicked() {}
  void onBtnWorkspaceAndFindDesignerClicked() {}
  void onBtnFindJobCliked() {}

  void onBtnProfileDetailsClicked() {}
}

abstract class HeaderAuthenticationListener<T extends StatefulWidget>
    implements State<T> {
  void onBtnSignupClicked() {}
  void onBtnSigninClicked() {}
  void onBtnSignoutClicked() {}
}
