import 'package:daisy_application/core_services/models/request/request_model.dart';
import 'package:flutter/material.dart';

class DiscoveryJobScreenState extends ChangeNotifier {
  List<RequestModel> requests = [];
  bool _isRequestLoading = false;

  set isRequestLoading(bool value) {
    _isRequestLoading = value;
    notifyListeners();
  }

  bool get isRequestLoading => _isRequestLoading;

  void addRequest(RequestModel request) {
    requests.add(request);
    notifyListeners();
  }

  void addRequests(List<RequestModel> values) {
    // values.removeWhere((newElement) =>
    //     requests
    //         .where((existElemement) => newElement.id == existElemement.id)
    //         .length ==
    //     1);
    requests.addAll(values);
    requests.sort(((a, b) =>
        b.createdAt!.millisecondsSinceEpoch -
        a.createdAt!.millisecondsSinceEpoch));
    notifyListeners();
  }
}
