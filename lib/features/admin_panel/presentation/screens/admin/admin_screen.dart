import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate_admin/core/di/injection.dart';
import 'package:real_estate_admin/features/admin_panel/data/models/agent_model.dart';
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
  bool isRevenueCardExpanded = false;

  void toggleAgentCardExpansion() {
    setState(() {
      isAgentCardExpanded = !isAgentCardExpanded;
      isRevenueCardExpanded = false;
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
  void toggleRevenueCardExpansion() {
    setState(() {
      isRevenueCardExpanded = !isRevenueCardExpanded;
      isAgentCardExpanded = false;
    });
  }

  Widget _buildHeader() {
    return const Padding(
      padding: EdgeInsets.only(bottom: 24),
      child: HeaderSectionAdminPanel(
        userName: "Djordje Tovilovic",
        userRole: "Admin",
        imageUrl:
            "https://media2.dev.to/dynamic/image/width=800%2Cheight=%2Cfit=scale-down%2Cgravity=auto/https%3A%2F%2Fwww.gravatar.com%2Favatar%2F2c7d99fe281ecd3bcd65ab915bac6dd5%3Fs%3D250",
      ),
    );
  }

  Widget _buildAgentCard() {
    return BlocBuilder<AgentBloc, AgentState>(
      builder: (context, state) {
        int total = 0;
        List<AgentModel> agents = [];

        if (state is AgentLoaded) {
          total = state.agents.length;
          agents = state.agents;
        }

        return TotalAgentsCard(
          totalAgents: total,
          agents: agents,
          isExpanded: isAgentCardExpanded,
          onToggleExpanded: toggleAgentCardExpansion,
        );
      },
    );
  }

  Widget _buildRevenueCard() {
    return TotalRevenueCard(
      isExpanded: isRevenueCardExpanded,
      onToggleExpanded: toggleRevenueCardExpansion,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: isAgentCardExpanded
              ? Column(
                  children: [
                    _buildHeader(),
                    Expanded(child: _buildAgentCard()),
                  ],
                )
              : isRevenueCardExpanded
                  ? Column(
                      children: [
                        _buildHeader(),
                        Expanded(child: _buildRevenueCard()),
                      ],
                    )
                  : SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildHeader(),
                          _buildRevenueCard(),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(child: _buildAgentCard()),
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
                    ),
        ),
      ),
    );
  }
}
