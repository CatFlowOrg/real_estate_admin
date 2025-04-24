import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';

import 'package:real_estate_admin/core/di/injection.dart';
import 'package:real_estate_admin/core/navigation/navigation.dart';
import 'package:real_estate_admin/core/theme/theme.dart';
import 'package:real_estate_admin/core/theme/util.dart';
import 'package:real_estate_admin/core/utils/auth_notifier.dart';

import 'package:real_estate_admin/features/admin_panel/presentation/screens/admin/admin_screen.dart';
import 'package:real_estate_admin/features/real_estate/presentation/screens/real_estate/real_estate_screen.dart';
import 'package:real_estate_admin/features/settings/presentation/screens/setting_screen.dart';
import 'package:real_estate_admin/features/task/presentation/screens/task_screen.dart';
import 'package:real_estate_admin/features/settings/presentation/bloc/locale_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();

  final authNotifier = getIt<AuthNotifier>();
  await authNotifier.init();

  runApp(MyApp(authNotifier: authNotifier));
}

class MyApp extends StatelessWidget {
  final AuthNotifier authNotifier;
  const MyApp({super.key, required this.authNotifier});

  @override
  Widget build(BuildContext context) {
    final textTheme = createTextTheme(context, "Roboto", "Inter");
    final MaterialTheme theme = MaterialTheme(textTheme);

    return BlocProvider<LocaleCubit>(
      create: (_) => LocaleCubit(),
      child: BlocBuilder<LocaleCubit, Locale>(
        builder: (context, locale) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            locale: locale,
            supportedLocales: const [
              Locale('en'),
              Locale('sr'),
            ],
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            theme: theme.light(),
            routerConfig: createRouter(authNotifier),
          );
        },
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  final Widget child;

  const MainScreen({super.key, required this.child});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<String> _routes = ['/admin_panel', '/real_estate', '/task', '/setting'];

  int get _currentIndex {
    final location = GoRouterState.of(context).uri.toString();
    final index = _routes.indexWhere((route) => location.startsWith(route));
    return index == -1 ? 0 : index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: const [
          AdminScreen(),
          RealEstateScreen(),
          TaskScreen(),
          SettingScreen(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          context.go(_routes[index]);
        },
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.dashboard_outlined),
            selectedIcon: const Icon(Icons.dashboard),
            label: AppLocalizations.of(context)!.admin_panel,
          ),
          NavigationDestination(
            icon: const Icon(Icons.home_work_outlined),
            selectedIcon: const Icon(Icons.home_work),
            label: AppLocalizations.of(context)!.real_estate,
          ),
          NavigationDestination(
            icon: const Icon(Icons.task_alt_outlined),
            selectedIcon: const Icon(Icons.task_alt),
            label: AppLocalizations.of(context)!.tasks,
          ),
          NavigationDestination(
            icon: const Icon(Icons.settings_outlined),
            selectedIcon: const Icon(Icons.settings),
            label: AppLocalizations.of(context)!.settings_title,
          ),
        ],
      ),
    );
  }
}
