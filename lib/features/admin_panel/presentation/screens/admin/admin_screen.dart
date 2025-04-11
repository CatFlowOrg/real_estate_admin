import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate_admin/core/di/injection.dart';
import 'package:real_estate_admin/features/admin_panel/presentation/screens/admin/section/header_section_admin_panel.dart';
import 'package:real_estate_admin/features/admin_panel/presentation/screens/admin/section/total_agents_card.dart';
import 'package:real_estate_admin/features/admin_panel/presentation/screens/admin/section/total_revenue_card.dart';

import 'package:real_estate_admin/features/admin_panel/presentation/bloc/agent_bloc/agent_bloc.dart';
import 'package:real_estate_admin/features/admin_panel/presentation/bloc/agent_bloc/agent_event.dart';
import 'package:real_estate_admin/features/admin_panel/presentation/bloc/agent_bloc/agent_state.dart';

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

class _AdminScreenContent extends StatefulWidget {
  const _AdminScreenContent();

  @override
  State<_AdminScreenContent> createState() => _AdminScreenContentState();
}

class _AdminScreenContentState extends State<_AdminScreenContent> {
  bool isAgentCardExpanded = false;

  void toggleAgentCardExpansion() {
    setState(() {
      isAgentCardExpanded = !isAgentCardExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ));
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
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
                  Widget agentCard;

                  if (state is AgentLoading) {
                    agentCard = const Center(child: CircularProgressIndicator());
                  } else if (state is AgentError) {
                    agentCard = const Text("Error");
                  } else if (state is AgentLoaded) {
                    agentCard = TotalAgentsCard(
                      totalAgents: state.agents.length,
                      agents: state.agents,
                      isExpanded: isAgentCardExpanded,
                      onToggleExpanded: toggleAgentCardExpansion,
                    );
                  } else {
                    agentCard = const SizedBox.shrink();
                  }

                  if (isAgentCardExpanded) {
                    return Padding(
                      padding: const EdgeInsets.all(16),
                      child: agentCard,
                    );
                  } else {
                    return SingleChildScrollView(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(child: agentCard),
                              const SizedBox(width: 12),
                              const Expanded(
                                child: SizedBox(
                                  height: 120,
                                  child: Placeholder(),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
