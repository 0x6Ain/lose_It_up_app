import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lose_it_up_app/features/authentication/presentation/account/user_account_card.dart';
import 'package:lose_it_up_app/routes/app_router.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person_add_alt_1_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_outlined),
          ),
          IconButton(
            onPressed: () => context.goNamed(AppRoute.setting.name),
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const UserAccountWidget(),
              Container(
                height: 600,
                color: Colors.redAccent,
                child: const Center(child: Text('Not Implemented')),
              ),
              ElevatedButton.icon(
                onPressed: () => context.goNamed(AppRoute.signIn.name),
                icon: const Icon(Icons.settings),
                label: const Text('Settings'),
              ),
              Container(
                height: 600,
                color: Colors.yellowAccent,
                child: const Center(child: Text('Not Implemented')),
              ),
              Container(
                height: 600,
                color: Colors.orangeAccent,
                child: const Center(child: Text('Not Implemented')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
