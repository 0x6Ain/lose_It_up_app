import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            child: Text('profile'),
          ),
          Card(
            child: Text('interLock'),
          ),
          Card(
            child: Text('unit'),
          ),
          Divider(),
          Card(
            child: Text('Alarm'),
          ),
          Card(
            child: Text('Events'),
          ),
          Card(
            child: Text('Terms of service'),
          ),
        ],
      ),
    );
  }
}
