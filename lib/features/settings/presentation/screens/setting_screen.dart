import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:real_estate_admin/core/di/injection.dart';
import 'package:real_estate_admin/features/auth/presentation/bloc/auth_bloc.dart';

import '../../../../core/utils/auth_notifier.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (context) => getIt<AuthBloc>(),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state){
          if (state is LogoutStateSuccess) {
            getIt<AuthNotifier>().logout();
            context.go('/login');
          }

          else if(state is LogoutStateError){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Error"))
            );
          }
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Scaffold(
              body: Column(children: [
                Spacer(),
                Builder(
                  builder: (context) {
                    return SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            backgroundColor: Colors.green,
                          ),
                          onPressed: () {
                            context.read<AuthBloc>().add(LogoutUser());
                          },
                          child: const Text(
                            "Logout",
                            style: TextStyle(color: Colors.white),
                          ),
                        ));
                  }
                ),
                SizedBox(height: 12,),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
