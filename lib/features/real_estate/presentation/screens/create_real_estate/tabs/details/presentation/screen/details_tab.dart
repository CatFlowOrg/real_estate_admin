import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate_admin/features/real_estate/presentation/screens/create_real_estate/bloc/create_real_estate_bloc.dart';
import 'package:real_estate_admin/features/real_estate/presentation/screens/create_real_estate/bloc/create_real_estate_event.dart';
import 'package:real_estate_admin/features/real_estate/presentation/screens/create_real_estate/bloc/create_real_estate_state.dart';

class DetailsTab extends StatelessWidget {
  const DetailsTab({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateRealEstateBloc, CreateRealEstateState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextFormField(
                initialValue: state.title ?? '',
                decoration: const InputDecoration(labelText: 'Title'),
                onChanged: (val) => context.read<CreateRealEstateBloc>().add(UpdateRealEstateTitle(val)),
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: state.description ?? '',
                decoration: const InputDecoration(labelText: 'Description'),
                onChanged: (val) => context.read<CreateRealEstateBloc>().add(UpdateRealEstateDescription(val)),
              ),
              
              ElevatedButton(onPressed:()=>_showFilterBottomSheet(context) , child: const Text("data"))
            ],
          ),
        );
      },
    );
  }
}

void _showFilterBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (_) => const FilterBottomSheet(),
  );
}


class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  Set<int> selectedIds = {};

  final List<_FilterOption> options = [
    _FilterOption(id: 1, assetPath: 'assets/img/sync/cro/njuskalo.png', label: "Njuskalo"),
    _FilterOption(id: 2, assetPath: 'assets/img/sync/cro/indomio.png', label: "Indomio"),
    _FilterOption(id: 3, assetPath: 'assets/img/sync/cro/njuskalo.png', label: "Vila"),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: options.map((option) {
            final isSelected = selectedIds.contains(option.id);
            return ListTile(
              leading: Image.asset(option.assetPath, width: 32, height: 32),
              title: Text(option.label),
              trailing: Checkbox(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                value: isSelected,
                onChanged: (_) {
                  setState(() {
                    if (isSelected) {
                      selectedIds.remove(option.id);
                    } else {
                      selectedIds.add(option.id);
                    }
                  });
                },
              ),
              onTap: () {
                setState(() {
                  if (isSelected) {
                    selectedIds.remove(option.id);
                  } else {
                    selectedIds.add(option.id);
                  }
                });
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}


class _FilterOption {
  final int id;
  final String assetPath;
  final String label;

  _FilterOption({
    required this.id,
    required this.assetPath,
    required this.label,
  });
}
