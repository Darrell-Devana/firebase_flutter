import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isDoorLocked1 = false; // Initial value for the first switch
  bool isDoorLocked2 = false; // Initial value for the second switch
  bool isDoorLocked3 = false; // Initial value for the third switch

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Read and Write'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const Center(
            child: Text(
              'Door lock',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20),
          Column(
            children: [
              SwitchListTile(
                title: Text(isDoorLocked1 ? 'Locked' : 'Unlocked'),
                value: isDoorLocked1,
                onChanged: (bool value) {
                  setState(() {
                    isDoorLocked1 = value;
                  });
                },
                secondary: Icon(isDoorLocked1 ? Icons.lock : Icons.lock_open),
              ),
              SwitchListTile(
                title: Text(isDoorLocked2 ? 'Locked' : 'Unlocked'),
                value: isDoorLocked2,
                onChanged: (bool value) {
                  setState(() {
                    isDoorLocked2 = value;
                  });
                },
                secondary: Icon(isDoorLocked2 ? Icons.lock : Icons.lock_open),
              ),
              SwitchListTile(
                title: Text(isDoorLocked3 ? 'Locked' : 'Unlocked'),
                value: isDoorLocked3,
                onChanged: (bool value) {
                  setState(() {
                    isDoorLocked3 = value;
                  });
                },
                secondary: Icon(isDoorLocked3 ? Icons.lock : Icons.lock_open),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
