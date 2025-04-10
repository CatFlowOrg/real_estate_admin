import 'package:flutter/material.dart';
import 'package:real_estate_admin/core/ui/app_text_styles.dart';
import 'package:real_estate_admin/features/real_estate/presentation/screens/real_estate/components/search_bar_fiter.dart';

class RealEstateScreen extends StatelessWidget {
  const RealEstateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: SearchBarFilter(
                onFilterTap: () {
                  showModalBottomSheet(
                    context: context,
                    useRootNavigator: true,

                    builder: (_) => const Center(child: Text('Filter options here')),
                  );
                },
                onChanged: (value) {
                  // Ovde filtriraj listu nekretnina
                  print('Search query: $value');
                },
              ),
            ),
            Text("Recent",style: AppTextStyles.headerText(context),),
            const Expanded(
              child: Center(
                child: Text('List of real estates will go here'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}