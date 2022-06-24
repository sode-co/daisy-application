import 'package:daisy_application/core_services/models/request/request_model.dart';
import 'package:flutter/material.dart';

class DiscoveryJobScreenState extends ChangeNotifier {
  List<RequestModel> requests = [];

  void addRequest(RequestModel request) {
    requests.add(request);
    notifyListeners();
  }

  void addRequests(List<RequestModel> request) {
    requests.addAll(request);
    notifyListeners();
  }
}
