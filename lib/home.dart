import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final databaseRef = FirebaseDatabase.instance.ref();
  late DatabaseReference reference;

  bool doorLock1 = false;
  bool doorLock2 = false;
  bool doorLock3 = false;
  var tempDescription;

  @override
  void initState() {
    super.initState();
    reference = databaseRef.child('rooms');
    reference.onValue.listen((event) {
      var snapshot = event.snapshot;
      if (snapshot.value != null) {
        var rooms = snapshot.value as Map<dynamic, dynamic>;
        setState(() {
          doorLock1 = rooms['door1'] ?? false;
          doorLock2 = rooms['door2'] ?? false;
          doorLock3 = rooms['door3'] ?? false;
        });
      }
    });

    DatabaseReference tempReference = databaseRef.child('temp');
    tempReference.onValue.listen((event) {
      var snapshot = event.snapshot;
      print(snapshot.value);
      if (snapshot.value != null) {
        setState(() {
          tempDescription = snapshot.value.toString();
        });
      } else {
        setState(() {
          tempDescription = '';
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Read and Write'),
      ),
      body: Center(
        child: Column(
          children: [
            buildRoomSwitch('door1', 'Room 1', doorLock1, (value) {
              setState(() {
                doorLock1 = value;
              });
              updateFirebaseValue('door1', value);
            }),
            buildRoomSwitch('door2', 'Room 2', doorLock2, (value) {
              setState(() {
                doorLock2 = value;
              });
              updateFirebaseValue('door2', value);
            }),
            buildRoomSwitch('door3', 'Room 3', doorLock3, (value) {
              setState(() {
                doorLock3 = value;
              });
              updateFirebaseValue('door3', value);
            }),
            SizedBox(
              height: 10,
            ),
            Text(
                'Temperature: ${tempDescription ?? ''}'), // Use the null-aware operator (??) to handle null values
          ],
        ),
      ),
    );
  }

  Widget buildRoomSwitch(String databaseKey, String roomName, bool isLocked,
      Function(bool) onChanged) {
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

  void updateFirebaseValue(String databaseKey, bool value) {
    reference.child(databaseKey).set(value);
  }
}
