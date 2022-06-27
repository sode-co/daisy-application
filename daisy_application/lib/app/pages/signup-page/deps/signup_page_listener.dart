import 'package:daisy_application/common/constants.dart';
import 'package:flutter/material.dart';

abstract class SignupPageListener<T extends StatefulWidget> extends State<T> {
  void onBtnSignupClicked(UserRole selectedRole);
}
