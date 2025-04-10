import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RealEstateDetails extends StatelessWidget {
  final int id;

  const RealEstateDetails({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Center(child: Text("Details for Real Estate ID: $id")),
    );
  }
}
