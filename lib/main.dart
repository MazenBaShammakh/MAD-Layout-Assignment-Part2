import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './widgets/devices_grid.dart';
import './models/device.dart';
import './providers/devices.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => Devices())],
      child: MaterialApp(
        title: 'IoT Panel',
        home: DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(
                tabs: [
                  Tab(
                    child: Text('All'),
                  ),
                  Tab(
                    child: Text('Bedroom'),
                  ),
                  Tab(
                    child: Text('Kitchen'),
                  ),
                  Tab(
                    child: Text('Outdoor'),
                  ),
                ],
              ),
              title: Text('My Home'),
            ),
            // body: DevicesGrid(),
            body: TabBarView(
              children: [
                DevicesGrid(filter: Location.All),
                DevicesGrid(filter: Location.Bedroom),
                DevicesGrid(filter: Location.Kitchen),
                DevicesGrid(filter: Location.Outdoor),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                  title: Text('Home'),
                  icon: Icon(
                    Icons.home,
                    color: Colors.blue,
                  ),
                ),
                BottomNavigationBarItem(
                  title: Text('Messages'),
                  icon: Icon(
                    Icons.message_outlined,
                    color: Colors.grey,
                  ),
                ),
                BottomNavigationBarItem(
                  title: Text('Profile'),
                  icon: Icon(
                    Icons.person_outline,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.add),
            ),
          ),
        ),
        theme: ThemeData(
          primaryColor: Colors.white,
          accentColor: Colors.blue,
        ),
      ),
    );
  }
}
