import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:real_estate_admin/core/di/injection.dart';
import 'package:real_estate_admin/core/ui/components/search_bar_filter.dart';
import 'package:real_estate_admin/core/ui/components/shimmer_effect_item.dart';
import 'package:real_estate_admin/features/location/presentation/cubit/location_cubit.dart';
import 'package:real_estate_admin/features/real_estate/presentation/bloc/real_estate_bloc.dart';
import 'package:real_estate_admin/features/real_estate/presentation/screens/real_estate/components/real_estate_item_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RealEstateScreen extends StatelessWidget {
  const RealEstateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RealEstateBloc>(
          create: (_) => getIt<RealEstateBloc>()..add(const GetRealEstates()),
        ),
        BlocProvider<LocationCubit>(
          create: (_) => getIt<LocationCubit>(),
        ),
      ],
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => context.push("/createRealEstate"),
          child: const Icon(Icons.add),
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SearchBarFilter(
                      onFilterTap: () {
                        showModalBottomSheet(
                          context: context,
                          useRootNavigator: true,
                          builder: (_) => Center(
                            child: Text(AppLocalizations.of(context)!.filter_options),
                          ),
                        );
                      },
                      onChanged: (value) {
                        // Filtriranje liste nekretnina
                      },
                    ),
                    const SizedBox(height: 8),
                    Builder(
                      builder: (context) {
                        return ElevatedButton(
                          onPressed: () {
                            context.read<LocationCubit>().getLocation();
                          },
                          child: const Text("Get Location"),
                        );
                      }
                    ),
                  ],
                ),
              ),
              BlocListener<LocationCubit, LocationState>(
                listener: (context, state) {
                  if (state is LocationSuccess) {
                    final l = state.location;
                    final address = "${l.street}, ${l.city}, ${l.country}";
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Lokacija: $address")),
                    );
                  } else if (state is LocationError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Greška pri dohvatanju lokacije")),
                    );
                  }
                },
                child: Expanded(
                  child: BlocBuilder<RealEstateBloc, RealEstateState>(
                    builder: (context, state) {
                      if (state is RealEstateStateSuccess) {
                        final items = state.realEstateResponse.items ?? [];
                        return ListView.builder(
                          padding: const EdgeInsets.only(top: 8),
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                final itemId = items[index].id;
                                context.push('/realEstateDetails/$itemId');
                              },
                              child: RealEstateItemCard(item: items[index]),
                            );
                          },
                        );
                      } else if (state is RealEstateStateError) {
                        return const Padding(
                          padding: EdgeInsets.all(16),
                          child: Text("Greška pri učitavanju podataka"),
                        );
                      } else if (state is RealEstateStateLoading) {
                        return ListView.builder(
                          itemCount: 5,
                          itemBuilder: (context, index) => buildShimmerCard(context),
                        );
                      }
                      return const Center(child: CircularProgressIndicator());
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
