import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum ListingType {
  selling(0),
  renting(1);

  final int id;

  const ListingType(this.id);

  static ListingType fromId(int id) {
    return ListingType.values.firstWhere(
          (e) => e.id == id,
      orElse: () => ListingType.selling,
    );
  }

  String label(BuildContext context) {
    switch (this) {
      case ListingType.selling:
        return AppLocalizations.of(context)!.selling;
      case ListingType.renting:
        return AppLocalizations.of(context)!.renting;
    }
  }

  IconData get icon {
    switch (this) {
      case ListingType.selling:
        return Icons.sell;
      case ListingType.renting:
        return Icons.house;
    }
  }
}
