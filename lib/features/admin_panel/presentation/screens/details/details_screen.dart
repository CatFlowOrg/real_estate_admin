
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate_admin/core/di/injection.dart';
import 'package:real_estate_admin/features/admin_panel/presentation/screens/details/section/agents_chart.dart';
import 'package:real_estate_admin/features/admin_panel/presentation/screens/details/section/agents_details_body.dart';
import 'package:real_estate_admin/features/admin_panel/presentation/screens/details/section/agents_details_header.dart';
import 'package:real_estate_admin/features/admin_panel/presentation/bloc/agent_bloc/agent_bloc.dart';
import 'package:real_estate_admin/features/admin_panel/presentation/bloc/agent_bloc/agent_event.dart';
import 'package:real_estate_admin/features/admin_panel/presentation/bloc/agent_bloc/agent_state.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AgentBloc>()..add(const LoadAgentsEvent()),
      child: const _AgentDetailsContent(),
    );
  }
}

class _AgentDetailsContent extends StatelessWidget {
  const _AgentDetailsContent();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: const Text('Total Agents'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: BlocBuilder<AgentBloc, AgentState>(
        builder: (context, state) {
          if (state is AgentLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AgentLoaded) {
            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              children: [
                AgentDetailsHeader(totalAgents: state.agents.length),
                const AgentChart(),
                const SizedBox(height: 10),
                AgentDetailsBody(agents: state.agents),
              ],
            );
          } else if (state is AgentError) {
            return const Text("ERROR");
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
