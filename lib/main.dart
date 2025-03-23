import 'package:flutter/material.dart';
import 'package:real_estate_admin/core/di/injection.dart';
import 'package:real_estate_admin/core/theme/theme.dart';

import 'core/navigation/navigation.dart';
import 'core/theme/util.dart';

Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;

    TextTheme textTheme = createTextTheme(context, "Roboto", "Inter");

    MaterialTheme theme = MaterialTheme(textTheme);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      routerConfig: appRouter,
    );
  }
}