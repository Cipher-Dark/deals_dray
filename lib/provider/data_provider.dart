import 'package:flutter/material.dart';

class DataProvider extends ChangeNotifier {
  String? deviceId;
  String? userId;
  String getDeviceID() => deviceId!;
  String getUserID() => userId!;
  void setDeviceID(String id) {
    deviceId = id;
    notifyListeners();
  }

  void setUserID(String id) {
    userId = id;
    notifyListeners();
  }
}
