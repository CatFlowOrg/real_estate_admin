import 'package:go_router/go_router.dart';
import 'package:real_estate_admin/features/admin_panel/presentation/screens/add_widget/add_widget_screen.dart';
import 'package:real_estate_admin/features/admin_panel/presentation/screens/admin/admin_screen.dart';
import 'package:real_estate_admin/features/admin_panel/presentation/screens/details/details_screen.dart';
import 'package:real_estate_admin/features/real_estate/presentation/screens/real_estate_screen.dart';
import 'package:real_estate_admin/features/settings/presentation/screens/setting_screen.dart';
import 'package:real_estate_admin/features/task/presentation/screens/task_screen.dart';

import '../../features/auth/presentation/screens/login_screen.dart';
import '../../main.dart';
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
        builder: (context, state) => const DetailsScreen(),
      ),
      GoRoute(
        path: '/add_widget',
        builder: (context, state) => const AddWidgetScreen(),
      ),
      ShellRoute(
        builder: (context, state, child) {
          return MainScreen(child: child);
        },
        routes: [
          GoRoute(
            path: '/admin_panel',
            name: 'admin_panel',
            builder: (context, state) => const AdminScreen(),
          ),
          GoRoute(
            path: '/real_estate',
            builder: (context, state) => const RealEstateScreen(),
          ),
          GoRoute(
            path: '/task',
            builder: (context, state) => const TaskScreen(),
          ),
          GoRoute(
            path: '/setting',
            builder: (context, state) => const SettingScreen(),
          ),
        ],
      ),
    ],
  );
}