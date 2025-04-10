import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:real_estate_admin/core/di/injection.dart';
import 'package:real_estate_admin/core/ui/app_text_styles.dart';
import 'package:real_estate_admin/features/real_estate/presentation/bloc/real_estate_bloc.dart';
import 'package:real_estate_admin/features/real_estate/presentation/screens/real_estate/components/real_estate_item_card.dart';
import 'package:real_estate_admin/features/real_estate/presentation/screens/real_estate/components/search_bar_fiter.dart';

class RealEstateScreen extends StatelessWidget {
  const RealEstateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RealEstateBloc>(
      create: (context)=> getIt<RealEstateBloc>()..add(const GetRealEstates()),
      child: Scaffold(
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
                  },
                ),
              ),
              BlocBuilder<RealEstateBloc, RealEstateState>(
                builder: (context, state) {
                  if (state is RealEstateStateSuccess) {
                    final items = state.realEstateResponse.items ?? [];

                    return Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.only(top: 8),
                        itemCount: items.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                final itemId = items[index].id;
                                if (itemId != null) {
                                  context.push('/realEstateDetails/$itemId');
                                }
                              },
                              child: RealEstateItemCard(item: items[index]),
                            );
                          }

                      ),
                    );
                  } else if (state is RealEstateStateError) {
                    return const Padding(
                      padding: EdgeInsets.all(16),
                      child: Text("Greška pri učitavanju podataka"),
                    );
                  }

                  return const Padding(
                    padding: EdgeInsets.all(16),
                    child: CircularProgressIndicator(),
                  );
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}