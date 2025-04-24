import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum RealEstateType {
  noType(0),
  house(1),
  flat(2),
  garage(3),
  land(4),
  office(5),
  apartment(6);

  final int id;

  const RealEstateType(this.id);

  static RealEstateType fromId(int id) {
    return RealEstateType.values.firstWhere(
          (e) => e.id == id,
      orElse: () => RealEstateType.noType,
    );
  }

  String label(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    switch (this) {
      case RealEstateType.noType:
        return localizations.noType;
      case RealEstateType.house:
        return localizations.house;
      case RealEstateType.flat:
        return localizations.flat;
      case RealEstateType.garage:
        return localizations.garage;
      case RealEstateType.land:
        return localizations.land;
      case RealEstateType.office:
        return localizations.office;
      case RealEstateType.apartment:
        return localizations.apartment;
    }
  }

  IconData get icon {
    switch (this) {
      case RealEstateType.noType:
        return Icons.help_outline;
      case RealEstateType.house:
        return Icons.house;
      case RealEstateType.flat:
        return Icons.apartment;
      case RealEstateType.garage:
        return Icons.garage;
      case RealEstateType.land:
        return Icons.terrain;
      case RealEstateType.office:
        return Icons.business;
      case RealEstateType.apartment:
        return Icons.location_city;
    }
  }
}
