import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lose_it_up_app/features/authentication/presentation/account/user_account_card.dart';
import 'package:lose_it_up_app/features/authentication/settings/presenatation/setting_list_modal.dart';
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
            onPressed: () async {
              final result = await showModalBottomSheet<AppRoute>(
                  useRootNavigator: true,
                  useSafeArea: false,
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(10.0),
                    ),
                  ),
                  builder: (_) => const SettingListModal());
              if (result != null) {
                context.goNamed(result.name);
              }
            },
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      body: const Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: [
              UserAccountWidget(),
              SizedBox(
                height: 600,
                child: Center(child: Text('Not Implemented')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
