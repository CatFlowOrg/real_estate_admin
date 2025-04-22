import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate_admin/core/di/injection.dart';
import 'package:real_estate_admin/core/ui/components/circle_icon_button.dart';
import 'package:real_estate_admin/features/real_estate/presentation/bloc/real_estate_bloc.dart';
import 'package:real_estate_admin/features/real_estate/presentation/screens/real_estate_details/contents/re_details_content_success.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class RealEstateDetails extends StatelessWidget {
  final int id;

  const RealEstateDetails({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<RealEstateBloc>()..add(GetRealEstateDetails(id)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.real_estate_details),
          actions: [
            circleIconButton(icon: Icons.edit),
            circleIconButton(icon: Icons.share),
          ],
        ),
        body: BlocBuilder<RealEstateBloc, RealEstateState>(
          builder: (context, state) {
            return switch (state) {
              RealEstateStateLoading() =>
                const Center(child: CircularProgressIndicator()),
              RealEstateDetailsSuccess(:final realEstateDetailsResponse) =>
                ReDetailsContentSuccess(response: realEstateDetailsResponse),
              RealEstateStateError() => const Center(child: Text('Error:')),
              _ => const SizedBox.shrink(),
            };
          },
        ),
      ),
    );
  }
}
