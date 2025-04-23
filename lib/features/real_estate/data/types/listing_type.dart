enum ListingType {
  selling,
  renting,
}

extension ListingTypeExtension on ListingType {
  int get value {
    switch (this) {
      case ListingType.selling:
        return 0;
      case ListingType.renting:
        return 1;
    }
  }

  static ListingType fromValue(int value) {
    switch (value) {
      case 0:
        return ListingType.selling;
      case 1:
        return ListingType.renting;
      default:
        throw Exception("Invalid ListingType value");
    }
  }
}
