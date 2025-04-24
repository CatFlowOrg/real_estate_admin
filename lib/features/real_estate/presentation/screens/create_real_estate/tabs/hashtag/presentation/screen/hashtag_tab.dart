import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate_admin/features/real_estate/presentation/screens/create_real_estate/bloc/create_real_estate_bloc.dart';
import 'package:real_estate_admin/features/real_estate/presentation/screens/create_real_estate/bloc/create_real_estate_event.dart';
import 'package:real_estate_admin/features/real_estate/presentation/screens/create_real_estate/tabs/hashtag/presentation/cubit/hashtag_cubit.dart';
import 'package:real_estate_admin/features/real_estate/presentation/screens/create_real_estate/tabs/hashtag/presentation/cubit/hashtag_state.dart';


class HashtagTab extends StatelessWidget {
  const HashtagTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HashtagCubit, HashtagState>(
      builder: (context, state) {
        if (state is HashtagLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is HashtagLoaded) {
          final hashtags = state.hashtags;
          final selected = context.select((CreateRealEstateBloc bloc) => bloc.state.selectedHashtags);

          return Wrap(
            spacing: 8,
            children: hashtags.map((tag) {
              final isSelected = selected.contains(tag.id);
              return FilterChip(
                label: Text(tag.name),
                selected: isSelected,
                onSelected: (value) {
                  final updated = value
                      ? [...selected, tag.id]
                      : selected.where((e) => e != tag.id).toList();

                  context.read<CreateRealEstateBloc>().add(UpdateSelectedHashtags(updated));
                },
              );
            }).toList(),
          );
        } else {
          return const Center(child: Text("Greška pri učitavanju hashtagova"));
        }
      },
    );

  }
}
