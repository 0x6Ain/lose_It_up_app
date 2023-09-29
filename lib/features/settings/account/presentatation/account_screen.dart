import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lose_it_up_app/common/alert_dialogs.dart';
import 'package:lose_it_up_app/common/tappabale_list_item.dart';
import 'package:lose_it_up_app/features/authentication/data/fake_auth_repository.dart';
import 'package:lose_it_up_app/features/settings/account/presentatation/account_screen_controller.dart';

import 'package:lose_it_up_app/utils/extension.dart';
import 'package:lose_it_up_app/utils/theme_state.dart';

class AccountScreen extends ConsumerWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(themeStateProvider);
    final user = ref.watch(authStateChangesProvider).value;
    final state = ref.watch(accountScreenControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: state.isLoading ? const CircularProgressIndicator() : const Text('Account Center'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Accounts',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              TappableListItem(
                leadIcon: Icons.email_outlined,
                leadText: 'Email'.hardcoded,
                rearText: user?.email,
                rearIcon: null,
              ),
              TappableListItem(
                leadIcon: Icons.account_circle_outlined,
                leadText: 'Change nickname'.hardcoded,
                rearText: user?.name,
                onPressed: () => showNotImplementedAlertDialog(context: context),
              ),
              TappableListItem(
                leadIcon: Icons.password_outlined,
                leadText: 'Change password'.hardcoded,
                onPressed: () => showNotImplementedAlertDialog(context: context),
              ),
              Text(
                'Etc',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              TappableListItem(
                leadIcon: themeState == ThemeMode.dark
                    ? Icons.dark_mode_outlined
                    : Icons.light_mode_outlined,
                leadText:
                    themeState == ThemeMode.dark ? 'Dark Mode'.hardcoded : 'Light Mode'.hardcoded,
                onPressed: () => ref.read(themeStateProvider.notifier).changeMode(),
              ),
              TappableListItem(
                leadIcon: Icons.logout_outlined,
                leadText: 'Log out'.hardcoded,
                onPressed: () async {
                  final result = await showAlertDialog(
                      context: context,
                      title: 'Are you sure?'.hardcoded,
                      cancelActionText: 'Cancel');
                  if (result == true) {
                    print('sign out in screen');
                    ref.read(accountScreenControllerProvider.notifier).signOut();
                  }
                },
              ),
              TappableListItem(
                leadIcon: Icons.delete_outline_outlined,
                leadText: 'Delete account'.hardcoded,
                onPressed: () async {
                  final result = await showAlertDialog(
                      context: context,
                      title: 'Are you sure?'.hardcoded,
                      cancelActionText: 'Cancel');
                  if (result == true) {
                    ref.read(accountScreenControllerProvider.notifier).delete();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
