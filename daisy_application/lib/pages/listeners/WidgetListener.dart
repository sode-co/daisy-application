import 'package:daisy_application/common/constants.dart';
import 'package:flutter/cupertino.dart';

mixin WidgetListener {
  void onBtnSignupClicked(UserRole selectedRole, BuildContext context);
  void onBtnSigninClicked() {}
}
