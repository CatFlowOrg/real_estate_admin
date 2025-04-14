import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate_admin/core/di/injection.dart';
import 'package:real_estate_admin/features/admin_panel/presentation/screens/admin/section/header_section_admin_panel.dart';
import 'package:real_estate_admin/features/admin_panel/presentation/screens/admin/section/total_agents_card.dart';
import 'package:real_estate_admin/features/admin_panel/presentation/screens/admin/section/total_revenue_card.dart';
import 'package:real_estate_admin/features/admin_panel/presentation/bloc/agent_bloc/agent_bloc.dart';
import 'package:real_estate_admin/features/admin_panel/presentation/bloc/agent_bloc/agent_event.dart';
import 'package:real_estate_admin/features/admin_panel/presentation/bloc/agent_bloc/agent_state.dart';
import 'package:real_estate_admin/features/auth/presentation/bloc/auth_bloc.dart';


class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<AgentBloc>()..add(const LoadAgentsEvent())),
        BlocProvider(create: (context) => getIt<AuthBloc>()..add(const GetUserInfo())),
      ],
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  if (state is GetUserInfoSuccess) {
                    return HeaderSectionAdminPanel(userResponse: state.userResponse);
                  } else if (state is AuthStateInitial) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
              const SizedBox(height: 24),
              const TotalRevenueCard(),
              const SizedBox(height: 16),
              BlocBuilder<AgentBloc, AgentState>(
                builder: (context, state) {
                  Widget agentCard;

                  if (state is AgentLoading) {
                    agentCard = const Center(child: CircularProgressIndicator());
                  } else if (state is AgentError) {
                    agentCard = const Text("Error loading agents");
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

                  return isAgentCardExpanded
                      ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: agentCard,
                  )
                      : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
