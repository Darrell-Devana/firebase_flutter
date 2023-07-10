import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isDoorLocked1 = false;
  bool isDoorLocked2 = false;
  bool isDoorLocked3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Read and Write'),
      ),
      body: Center(
        child: Column(
          children: [
            buildRoomSwitch('Room 1', isDoorLocked1, (value) {
              setState(() {
                isDoorLocked1 = value;
              });
            }),
            buildRoomSwitch('Room 2', isDoorLocked2, (value) {
              setState(() {
                isDoorLocked2 = value;
              });
            }),
            buildRoomSwitch('Room 3', isDoorLocked3, (value) {
              setState(() {
                isDoorLocked3 = value;
              });
            }),
          ],
        ),
      ),
    );
  }

  Widget buildRoomSwitch(
      String roomName, bool isLocked, Function(bool) onChanged) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
      child: Row(
        children: [
          Expanded(
            child: Text(roomName, style: TextStyle(fontSize: 18)),
          ),
          Transform.scale(
            scale:
                1.5, // Customize the switch size by adjusting the scale value
            child: Switch(
              value: isLocked,
              onChanged: onChanged,
              activeColor: Colors.green,
              inactiveTrackColor: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
