import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:real_estate_admin/auth/presentation/screens/login_screen.dart';

final GoRouter appRouter = GoRouter(routes: <RouteBase>[
  GoRoute(path: '/',
  builder: (BuildContext context, GoRouterState state){
    return  LoginScreen();
  })
]);