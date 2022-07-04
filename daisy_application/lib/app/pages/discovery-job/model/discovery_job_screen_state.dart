import 'package:daisy_application/core_services/models/request/request_model.dart';
import 'package:flutter/material.dart';

class DiscoveryJobScreenState extends ChangeNotifier {
  List<RequestModel> requests = [];
  RequestModel? _selectedRequest;
  bool _isRequestLoading = false;

  set selectedRequest(RequestModel? value) {
    _selectedRequest = value;
    notifyListeners();
  }

  RequestModel? get selectedRequest => _selectedRequest;

  set isRequestLoading(bool value) {
    _isRequestLoading = value;
  }

  bool get isRequestLoading => _isRequestLoading;

  void addRequest(RequestModel request) {
    requests.add(request);
    _selectedRequest ??= requests[0];

    notifyListeners();
  }

  void addRequests(List<RequestModel> values) {
    requests
      ..addAll(values)
      ..sort(((a, b) =>
          b.createdAt!.millisecondsSinceEpoch -
          a.createdAt!.millisecondsSinceEpoch));
    notifyListeners();
  }
}
