import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:real_estate_admin/admin_panel/presentation/admin_screen.dart';

final GoRouter appRouter = GoRouter(routes: <RouteBase>[
  GoRoute(path: '/',
  builder: (BuildContext context, GoRouterState state){
    return const AdminScreen();
  })
]);