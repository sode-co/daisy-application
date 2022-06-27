import 'package:daisy_application/core_services/models/request/request_model.dart';
import 'package:flutter/material.dart';

abstract class PostNewJobListener<T extends StatefulWidget>
    implements State<T> {
  void onBtnJobPostClicked() {}
}
