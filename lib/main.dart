import 'package:flutter/material.dart';
import 'package:real_estate_admin/core/di/injection.dart';
import 'package:real_estate_admin/core/theme/theme.dart';
import 'package:real_estate_admin/core/theme/util.dart';
import 'package:real_estate_admin/core/utils/auth_notifier.dart';

import 'core/navigation/navigation.dart';

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
    final brightness = View.of(context).platformDispatcher.platformBrightness;
    final textTheme = createTextTheme(context, "Roboto", "Inter");
    final MaterialTheme theme = MaterialTheme(textTheme);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      routerConfig: createRouter(authNotifier),
    );
  }
}
