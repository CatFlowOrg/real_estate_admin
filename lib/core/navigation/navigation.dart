import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:real_estate_admin/features/admin_panel/presentation/screens/admin_screen.dart';
import 'package:real_estate_admin/features/admin_panel/presentation/screens/agent_details_screen.dart';
import 'package:real_estate_admin/features/real_estate/presentation/screens/real_estate_screen.dart';
import 'package:real_estate_admin/features/settings/presentation/screens/setting_screen.dart';
import 'package:real_estate_admin/features/task/presentation/screens/task_screen.dart';

import '../../features/admin_panel/data/models/agent_model.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../utils/auth_notifier.dart';
GoRouter createRouter(AuthNotifier authNotifier) {
  return GoRouter(
    refreshListenable: authNotifier,
    initialLocation: '/login',
    redirect: (context, state) {
      final loggedIn = authNotifier.isLoggedIn;
      final isAtLogin = state.matchedLocation == '/login';

      if (!loggedIn && !isAtLogin) {
        return '/login';
      }
      if (loggedIn && isAtLogin) {
        return '/admin_panel';
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/details',
        builder: (context, state) {
          final extra = state.extra;
          if (extra is Map<String, dynamic> &&
              extra['totalAgents'] is int &&
              extra['agents'] != null) {
            return AgentDetailsScreen(
              totalAgents: extra['totalAgents'],
              agents: List<AgentModel>.from(extra['agents']),
            );
          } else {
            return const Scaffold(
              body: Center(child: Text("Neispravan broj agenata ili podaci nedostaju")),
            );
          }
        },
      ),


      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return Scaffold(
            body: navigationShell, // ovo je IndexedStack
            bottomNavigationBar: NavigationBar(
              selectedIndex: navigationShell.currentIndex,
              onDestinationSelected: navigationShell.goBranch,
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.dashboard_outlined),
                  selectedIcon: Icon(Icons.dashboard),
                  label: 'Admin',
                ),
                NavigationDestination(
                  icon: Icon(Icons.home_work_outlined),
                  selectedIcon: Icon(Icons.home_work),
                  label: 'Real Estate',
                ),
                NavigationDestination(
                  icon: Icon(Icons.task_alt_outlined),
                  selectedIcon: Icon(Icons.task_alt),
                  label: 'Tasks',
                ),
                NavigationDestination(
                  icon: Icon(Icons.settings_outlined),
                  selectedIcon: Icon(Icons.settings),
                  label: 'Settings',
                ),
              ],
            ),
          );
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/admin_panel',
                name: 'admin_panel',
                builder: (context, state) => const AdminScreen(),
              ),
            ],
          ),

          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/real_estate',
                builder: (context, state) => const RealEstateScreen(),
              ),
            ],
          ),

          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/task',
                builder: (context, state) => const TaskScreen(),
              ),
            ],
          ),

          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/setting',
                builder: (context, state) => const SettingScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
