import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate_admin/core/di/injection.dart';
import 'package:real_estate_admin/features/real_estate/presentation/bloc/real_estate_bloc.dart';

class RealEstateDetails extends StatelessWidget {
  final int id;

  const RealEstateDetails({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(context)=> getIt<RealEstateBloc>()..add( GetRealEstateDetails(id)),
      child: Scaffold(
        appBar: AppBar(
        ),
        body: Center(child: Text("Details for Real Estate ID: $id")),
      ),
    );
  }
}
