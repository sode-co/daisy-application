import 'package:daisy_application/core_services/models/user/user_model.dart';
import 'package:flutter/material.dart';

abstract class UpdateProfileListener<T extends StatefulWidget>
    implements State<T> {
  void onBtnUpdateProfileClicked(int id, UserModel user) {}
}
