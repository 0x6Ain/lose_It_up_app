import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lose_it_up_app/app.dart';
import 'package:lose_it_up_app/common/entire_layout/scaffold_with_nested_navigation.dart';
import 'package:lose_it_up_app/features/authentication/data/fake_auth_repository.dart';

import 'package:lose_it_up_app/features/authentication/presentation/account/account_screen.dart';
import 'package:lose_it_up_app/features/authentication/presentation/sign_in/sign_in_screen.dart';
import 'package:lose_it_up_app/features/authentication/settings/presenatation/setting_screen.dart';
import 'package:lose_it_up_app/features/meals/presentation/meal_list_screen.dart';
import 'package:lose_it_up_app/routes/go_router_refresh_stream.dart';
import 'package:lose_it_up_app/routes/not_found_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

enum AppRoute {
  home,
  account,
  signIn,
  setting,
  meal,
}

// private navigators
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorAKey = GlobalKey<NavigatorState>(debugLabel: 'shellA');
final _shellNavigatorBKey = GlobalKey<NavigatorState>(debugLabel: 'shellB');
final _shellNavigatorCKey = GlobalKey<NavigatorState>(debugLabel: 'shellC');

@Riverpod(keepAlive: true)
GoRouter goRouter(GoRouterRef ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return GoRouter(
    initialLocation: '/',
    navigatorKey: _rootNavigatorKey,
    refreshListenable: GoRouterRefreshStream(authRepository.authStateChanges()),
    redirect: (context, state) {
      final isLoggedIn = authRepository.currentUser != null;
      if (isLoggedIn) {
        if (state.matchedLocation == '/signIn') {
          return '/';
        }
      } else {
        if (state.matchedLocation.contains('/account')) {
          return '/signIn';
        }
      }
      return null;
    },
    routes: [
      // Stateful nested navigation based on:
      // https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/stateful_shell_route.dart
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          // the UI shell
          return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
        },
        branches: [
          // first branch (A)
          StatefulShellBranch(
            navigatorKey: _shellNavigatorAKey,
            routes: [
              // top route inside branch
              GoRoute(
                path: '/',
                name: AppRoute.home.name,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: HomeScreen(),
                ),
              ),
            ],
          ),
          // second branch (B)
          StatefulShellBranch(
            navigatorKey: _shellNavigatorBKey,
            routes: [
              // top route inside branch
              GoRoute(
                path: '/meals',
                name: AppRoute.meal.name,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: MealListScreen(),
                ),
              ),
            ],
          ),
          // third branch (C)
          StatefulShellBranch(
            navigatorKey: _shellNavigatorCKey,
            routes: [
              // top route inside branch
              GoRoute(
                  path: '/account',
                  name: AppRoute.account.name,
                  pageBuilder: (context, state) => const NoTransitionPage(
                        child: AccountScreen(),
                      ),
                  routes: [
                    GoRoute(
                      path: 'setting',
                      name: AppRoute.setting.name,
                      pageBuilder: (context, state) => const NoTransitionPage(
                        child: SettingScreen(),
                      ),
                    ),
                  ]),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/signIn',
        name: AppRoute.signIn.name,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: SignInScreen(),
        ),
      ),
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
  );
}
