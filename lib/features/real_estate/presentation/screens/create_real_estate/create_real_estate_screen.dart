import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate_admin/features/real_estate/presentation/screens/create_real_estate/bloc/create_real_estate_bloc.dart';
import 'package:real_estate_admin/features/real_estate/presentation/screens/create_real_estate/tabs/hashtag_tab.dart';



class DetailsTab extends StatelessWidget {
  const DetailsTab({super.key});
  @override
  Widget build(BuildContext context) => const Center(child: Text("Details form here"));
}

class FeaturesTab extends StatelessWidget {
  const FeaturesTab({super.key});
  @override
  Widget build(BuildContext context) => const Center(child: Text("Features form here"));
}

class ExtraTab extends StatelessWidget {
  const ExtraTab({super.key});
  @override
  Widget build(BuildContext context) => const Center(child: Text("Extra form here"));
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
    return BlocProvider(
      create: (_) => CreateRealEstateBloc(),
      child: Scaffold(
        appBar: AppBar(title: const Text("Create Real Estate")),
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

            return Stack(
              children: [
                Column(
                  children: [
                    // ✅ Progress bar
                    LinearProgressIndicator(
                      value: (currentStep + 1) / stepContents.length,
                      backgroundColor: Colors.grey.shade300,
                      valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
                    ),

                    // ✅ PageView sa swipe-om
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

                // ✅ Dugme "Next" / "Submit"
                Positioned(
                  bottom: 16,
                  right: 16,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      if (!isLastStep) {
                        context.read<CreateRealEstateBloc>().add(GoToStep(currentStep + 1));
                      } else {
                        // Submit handler
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Submitting...")),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                    icon: Icon(isLastStep ? Icons.check : Icons.arrow_forward),
                    label: Text(isLastStep ? "Submit" : "Next"),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
