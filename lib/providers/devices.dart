import 'package:flutter/material.dart';

import '../models/device.dart';

class Devices with ChangeNotifier {
  List<Device> devices = [
    Device(
      deviceName: 'Parking Light',
      location: Location.Outdoor,
      action: DeviceAction.OnOff,
      icon_init: Icons.flashlight_off_outlined,
      icon_final: Icons.flashlight_on_outlined,
    ),
    Device(
      deviceName: 'Electric Heater',
      location: Location.Kitchen,
      action: DeviceAction.Heater,
      icon_init: Icons.fireplace_outlined,
      icon_final: Icons.fireplace_outlined,
    ),
    Device(
      deviceName: 'Refrigerator',
      location: Location.Kitchen,
      action: DeviceAction.Cooler,
      icon_init: Icons.kitchen_outlined,
      icon_final: Icons.kitchen_outlined,
    ),
    Device(
      deviceName: 'Electricity Plug',
      location: Location.Bedroom,
      action: DeviceAction.OnOff,
      icon_init: Icons.power_off_outlined,
      icon_final: Icons.power_outlined,
    ),
    Device(
      deviceName: 'Modem',
      location: Location.Bedroom,
      action: DeviceAction.OnOff,
      icon_init: Icons.wifi_off_outlined,
      icon_final: Icons.wifi,
    ),
  ];

  List<Device> get getDevices {
    return [...devices];
  }
}
