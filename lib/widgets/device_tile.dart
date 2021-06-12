import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/device.dart';

class DeviceTile extends StatefulWidget {
  final Device device;

  const DeviceTile(
    this.device,
  );

  @override
  _DeviceTileState createState() => _DeviceTileState();
}

class _DeviceTileState extends State<DeviceTile> {
  void toggleStatus() {
    setState(() {
      widget.device.status = !widget.device.status;
      widget.device.curr_icon = (widget.device.curr_icon + 1) % 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    Icon _controllerIcon;
    Icon _statusIcon;
    Text _statusText;
    if (widget.device.action == DeviceAction.OnOff) {
      _controllerIcon = Icon(
        Icons.power_settings_new,
        color: widget.device.status ? Colors.green : Colors.red,
        size: 30,
      );
      _statusText = Text(widget.device.status ? 'ON' : 'OFF');
      _statusIcon = Icon(
        Icons.circle,
        size: 10,
        color: widget.device.status ? Colors.green : Colors.red,
      );
    } else if (widget.device.action == DeviceAction.Cooler) {
      _controllerIcon = Icon(
        Icons.ac_unit,
        color: widget.device.status ? Colors.blue[800] : Colors.blue[200],
        size: 30,
      );
      _statusText = Text(widget.device.status ? 'FREEZING' : 'COLD');
      _statusIcon = Icon(
        Icons.circle,
        size: 10,
        color: widget.device.status ? Colors.blue[800] : Colors.blue[200],
      );
    } else {
      _controllerIcon = Icon(
        Icons.local_fire_department,
        color:
            widget.device.status ? Colors.deepOrange[700] : Colors.orange[300],
        size: 30,
      );
      _statusText = Text(widget.device.status ? 'HOT' : 'WARM');
      _statusIcon = Icon(
        Icons.circle,
        size: 10,
        color:
            widget.device.status ? Colors.deepOrange[700] : Colors.orange[300],
      );
    }

    return Padding(
      padding: const EdgeInsets.all(10),
      child: GridTile(
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 18,
                        left: 6,
                      ),
                      child: Icon(
                        widget.device.curr_icon == 0
                            ? widget.device.icon_init
                            : widget.device.icon_final,
                        size: 40,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 18,
                        // right: 6,
                      ),
                      child: IconButton(
                        onPressed: toggleStatus,
                        icon: _controllerIcon,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 2,
                          ),
                          child: Text(
                            widget.device.deviceName,
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                right: 5,
                              ),
                              // child: Consumer<Device>(
                              //   builder: (_, device, ch) => _statusIcon,
                              // ),
                              child: _statusIcon,
                            ),
                            _statusText,
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
