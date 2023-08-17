import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lose_it_up_app/features/authentication/data/fake_auth_repository.dart';
import 'package:lose_it_up_app/features/authentication/presentation/user/user_account_card.dart';
import 'package:lose_it_up_app/features/authentication/settings/presenatation/setting_list_modal.dart';
import 'package:lose_it_up_app/routes/app_router.dart';

class UserScreen extends ConsumerWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authRepositoryProvider).currentUser;
    return Scaffold(
      appBar: AppBar(
        title: const Text('User'),
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
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: [
              UserAccountWidget(user: user),
              const SizedBox(
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
