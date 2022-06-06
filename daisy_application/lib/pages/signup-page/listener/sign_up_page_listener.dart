import 'package:daisy_application/common/constants.dart';
import 'package:flutter/material.dart';

abstract class SignUpPageListener {
  void onBtnSignupClicked(UserRole selectedRole, BuildContext context);
}
