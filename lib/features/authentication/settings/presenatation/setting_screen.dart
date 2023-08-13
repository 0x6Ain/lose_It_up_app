import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lose_it_up_app/routes/app_router.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Card(
              child: Text('profile'),
            ),
            const Card(
              child: Text('interLock'),
            ),
            const Card(
              child: Text('unit'),
            ),
            const Divider(),
            const Card(
              child: Text('Alarm'),
            ),
            const Card(
              child: Text('Events'),
            ),
            Row(
              children: [
                Card(
                  child: TextButton(
                    onPressed: () => context.goNamed(AppRoute.signIn.name),
                    child: const Text('SignIn'),
                  ),
                ),
                Card(
                  child: TextButton(
                    onPressed: () {},
                    child: const Text('Logout'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
