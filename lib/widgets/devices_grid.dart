import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'device_tile.dart';
import '../models/device.dart';
import '../providers/devices.dart';

class DevicesGrid extends StatelessWidget {
  final Location filter;

  const DevicesGrid({
    required this.filter,
  });

  @override
  Widget build(BuildContext context) {
    final List<Device> _devices = Provider.of<Devices>(context).getDevices;

    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5 / 1.15,
      ),
      children: filter == Location.All
          ? _devices.map((device) => DeviceTile(device)).toList()
          : _devices
              .where((device) => device.location == filter)
              .toList()
              .map((device) => DeviceTile(device))
              .toList(),
    );
  }
}
