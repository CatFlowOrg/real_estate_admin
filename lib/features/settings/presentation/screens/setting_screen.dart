import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:real_estate_admin/core/di/injection.dart';
import 'package:real_estate_admin/core/ui/app_text_styles.dart';
import 'package:real_estate_admin/features/auth/domain/repository/auth_repository.dart';
import 'package:real_estate_admin/features/auth/presentation/bloc/auth_bloc.dart';

import 'package:real_estate_admin/core/utils/auth_notifier.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authRepository = getIt<AuthRepository>();

    return BlocProvider<AuthBloc>(
      create: (context) => getIt<AuthBloc>(),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is LogoutStateSuccess) {
            getIt<AuthNotifier>().logout();
            context.go('/login');
          } else if (state is LogoutStateError) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Error")),
            );
          }
        },
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Container(width: double.infinity,
                  height: 200,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: Builder(
                      builder: (BuildContext context) {
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {
                            // context.read<AuthBloc>().add(const  LogoutUser());
                            authRepository.getUser();
                          },
                          child:  Text(
                            "Logout",
                            style: AppTextStyles.headerText(context).copyWith(color: Colors.white),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
