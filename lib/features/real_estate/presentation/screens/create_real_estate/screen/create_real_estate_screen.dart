import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate_admin/core/di/injection.dart';
import 'package:real_estate_admin/features/real_estate/presentation/screens/create_real_estate/bloc/create_real_estate_bloc.dart';
import 'package:real_estate_admin/features/real_estate/presentation/screens/create_real_estate/bloc/create_real_estate_event.dart';
import 'package:real_estate_admin/features/real_estate/presentation/screens/create_real_estate/bloc/create_real_estate_state.dart';
import 'package:real_estate_admin/features/real_estate/presentation/screens/create_real_estate/tabs/details/presentation/screen/details_tab.dart';
import 'package:real_estate_admin/features/real_estate/presentation/screens/create_real_estate/tabs/hashtag/presentation/cubit/hashtag_cubit.dart';
import 'package:real_estate_admin/features/real_estate/presentation/screens/create_real_estate/tabs/hashtag/presentation/screen/hashtag_tab.dart';

class FeaturesTab extends StatelessWidget {
  const FeaturesTab({super.key});
  @override
  Widget build(BuildContext context) => const Center(child: Text("Features tab here"));
}

class ExtraTab extends StatelessWidget {
  const ExtraTab({super.key});
  @override
  Widget build(BuildContext context) => const Center(child: Text("Extras tab here"));
}

class CreateRealEstateScreen extends StatefulWidget {
  const CreateRealEstateScreen({super.key});

  @override
  State<CreateRealEstateScreen> createState() => _CreateRealEstateScreenState();
}

class _CreateRealEstateScreenState extends State<CreateRealEstateScreen> {
  final PageController _pageController = PageController();

  static const List<Widget> stepContents = [
    HashtagTab(),
    DetailsTab(),
    FeaturesTab(),
    ExtraTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CreateRealEstateBloc>(
          create: (_) => CreateRealEstateBloc(),
        ),
        BlocProvider<HashtagCubit>(
          create: (_) => getIt<HashtagCubit>()..getHashtags(),
        ),
      ],
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocConsumer<CreateRealEstateBloc, CreateRealEstateState>(
          listener: (context, state) {
            _pageController.animateToPage(
              state.currentStep,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
          builder: (context, state) {
            final currentStep = state.currentStep;
            final isLastStep = currentStep == stepContents.length - 1;

            return SafeArea(
              child: Stack(
                children: [
                  Column(
                    children: [
                      LinearProgressIndicator(
                        value: (currentStep + 1) / stepContents.length,
                        backgroundColor: Colors.grey.shade300,
                        valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
                      ),
                      Expanded(
                        child: PageView.builder(
                          controller: _pageController,
                          itemCount: stepContents.length,
                          physics: const ClampingScrollPhysics(),
                          onPageChanged: (index) {
                            context.read<CreateRealEstateBloc>().add(GoToStep(index));
                          },
                          itemBuilder: (context, index) => stepContents[index],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 16,
                    right: 16,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        if (!isLastStep) {
                          context.read<CreateRealEstateBloc>().add(GoToStep(currentStep + 1));
                        } else {
                          final state = context.read<CreateRealEstateBloc>().state;
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Submitting ${state.title}...")),
                          );
                          // pozovi submit handler ovde
                        }
                      },
                      icon: Icon(isLastStep ? Icons.check : Icons.arrow_forward),
                      label: Text(isLastStep ? "Submit" : "Next"),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

}
