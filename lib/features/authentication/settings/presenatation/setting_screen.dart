import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lose_it_up_app/features/authentication/data/fake_auth_repository.dart';
import 'package:lose_it_up_app/features/authentication/settings/presenatation/setting_item_card.dart';
import 'package:lose_it_up_app/routes/app_router.dart';
import 'package:lose_it_up_app/utils/theme_state.dart';

class SettingScreen extends ConsumerWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(themeStateProvider);
    final authRepository = ref.read(authRepositoryProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SettingItemCard(
                text: 'darkMode',
                isSelected: themeState == ThemeMode.dark,
                onPressed: (value) => ref.read(themeStateProvider.notifier).changeDarkMode(value),
              ),
              SettingItemCard(
                text: 'interLock',
                isSelected: true,
                onPressed: (value) {},
              ),
              SettingItemCard(
                text: 'unit',
                isSelected: true,
                onPressed: (value) {},
              ),
              const Divider(),
              SettingItemCard(
                text: 'Alarm',
                isSelected: true,
                onPressed: (value) {},
              ),
              SettingItemCard(
                text: 'Events',
                isSelected: true,
                onPressed: (value) {},
              ),
              Card(
                child: TextButton(
                  onPressed: () {
                    authRepository.signOut();
                    context.goNamed(AppRoute.home.name);
                  },
                  child: const Text('Logout'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
