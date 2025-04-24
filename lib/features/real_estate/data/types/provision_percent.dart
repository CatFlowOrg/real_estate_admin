import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum ProvisionPercent {
  hidden(0),
  onePercent(1),
  twoPercent(2),
  threePercent(3),
  fourPercent(4),
  fivePercent(5),
  fiftyPercent(50);

  final int id;

  const ProvisionPercent(this.id);

  static ProvisionPercent fromId(int id) {
    return ProvisionPercent.values.firstWhere(
          (e) => e.id == id,
      orElse: () => ProvisionPercent.hidden,
    );
  }

  String label(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    switch (this) {
      case ProvisionPercent.hidden:
        return l10n.provisionHidden;
      case ProvisionPercent.onePercent:
        return "1%";
      case ProvisionPercent.twoPercent:
        return "2%";
      case ProvisionPercent.threePercent:
        return "3%";
      case ProvisionPercent.fourPercent:
        return "4%";
      case ProvisionPercent.fivePercent:
        return "5%";
      case ProvisionPercent.fiftyPercent:
        return "50%";
    }
  }
}
