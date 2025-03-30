import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate_admin/features/admin_panel/presentation/bloc/agent_bloc.dart';
import 'package:real_estate_admin/core/di/injection.dart';
import 'package:real_estate_admin/features/admin_panel/presentation/screens/contents/admin_panel_contents/total_revenue_card.dart';
import '../bloc/agent_event.dart';
import '../bloc/agent_state.dart';
import 'components/error_message.dart';
import 'contents/admin_panel_contents/header_section_admin_panel.dart';
import 'contents/admin_panel_contents/total_agents_card.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AgentBloc>()..add(const LoadAgentsEvent()),
      child: const _AdminScreenContent(),
    );
  }
}

class _AdminScreenContent extends StatelessWidget {
  const _AdminScreenContent();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed:(){context.read<AgentBloc>().add(const LoadAgentsEvent());}
        ),
        backgroundColor: const Color(0xFFF5F5F5),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderSectionAdminPanel(
                userName: "Djordje Tovilovic",
                userRole: "Admin",
                imageUrl:
                "https://media2.dev.to/dynamic/image/width=800%2Cheight=%2Cfit=scale-down%2Cgravity=auto%2Cformat=auto/https%3A%2F%2Fwww.gravatar.com%2Favatar%2F2c7d99fe281ecd3bcd65ab915bac6dd5%3Fs%3D250",
              ),
              const SizedBox(height: 24),

              const SizedBox(
                width: double.infinity,
                child: TotalRevenueCard(),
              ),

              const SizedBox(height: 16),

              BlocBuilder<AgentBloc, AgentState>(
                builder: (context, state) {
                  Widget leftCard;

                  if (state is AgentLoading) {
                    leftCard = const Center(child: CircularProgressIndicator());
                  } else if (state is AgentError) {
                    leftCard = const ErrorMessage();
                  } else if (state is AgentLoaded) {
                    leftCard = TotalAgentsCard(totalAgents: state.agents.length, agents: state.agents,);
                  } else {
                    leftCard = const SizedBox.shrink();
                  }

                  return Row(
                    children: [
                      Expanded(child: leftCard),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: SizedBox(
                          height: 120,
                          child: Placeholder(),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
