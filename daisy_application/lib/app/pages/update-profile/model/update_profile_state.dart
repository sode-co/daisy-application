import 'package:daisy_application/core_services/models/user/user_model.dart';
import 'package:flutter/material.dart';

class UpdateProfileState with ChangeNotifier {
  UserModel userProfile = UserModel.init()
    ..displayName = 'Ngoc'
    ..id = 1;
}
