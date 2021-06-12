import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum DeviceAction {
  OnOff,
  Cooler,
  Heater,
}

enum Location {
  All,
  Bedroom,
  Kitchen,
  Outdoor,
}

class Device with ChangeNotifier {
  final String deviceName;
  final Location location;
  final DeviceAction action;
  final IconData icon_init;
  final IconData icon_final;
  int curr_icon = 0;
  bool status = false;

  Device({
    required this.deviceName,
    required this.location,
    required this.action,
    required this.icon_init,
    required this.icon_final,
  });

  void toggleStatus() {
    status = !status;
    notifyListeners();
  }
}
