import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate_admin/core/ui/app_text_styles.dart';
import 'package:real_estate_admin/features/settings/presentation/bloc/locale_cubit.dart';


class LanguageSelectionSheet extends StatelessWidget {
  const LanguageSelectionSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Izaberite jezik", style: AppTextStyles.headerText(context)),
          const SizedBox(height: 16),
          ListTile(
            leading: const Text("🇷🇸"),
            title: const Text("Srpski"),
            onTap: () {
              context.read<LocaleCubit>().changeLocale(const Locale('sr'));
            },
          ),
          ListTile(
            leading: const Text("🇭🇷"),
            title: const Text("Hrvatski"),
            onTap: () {
              context.read<LocaleCubit>().changeLocale(const Locale('hr'));
            },
          ),
          ListTile(
            leading: const Text("🇺🇸"),
            title: const Text("English"),
            onTap: () {
              context.read<LocaleCubit>().changeLocale(const Locale('en'));
            },
          ),
        ],
      ),
    );
  }
}
