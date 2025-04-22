import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate_admin/core/di/injection.dart';
import 'package:real_estate_admin/features/admin_panel/presentation/screens/details/section/agents_chart.dart';
import 'package:real_estate_admin/features/admin_panel/presentation/screens/details/section/agents_details_body.dart';
import 'package:real_estate_admin/features/admin_panel/presentation/screens/details/section/agents_details_header.dart';
import 'package:real_estate_admin/features/admin_panel/presentation/bloc/agent_bloc/agent_bloc.dart';
import 'package:real_estate_admin/features/admin_panel/presentation/bloc/agent_bloc/agent_event.dart';
import 'package:real_estate_admin/features/admin_panel/presentation/bloc/agent_bloc/agent_state.dart';
import 'package:real_estate_admin/core/ui/components/search_bar_filter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


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

class _AgentDetailsContent extends StatefulWidget {
  const _AgentDetailsContent();

  @override
  State<_AgentDetailsContent> createState() => _AgentDetailsContentState();
}

class _AgentDetailsContentState extends State<_AgentDetailsContent> {
  String _searchQuery = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          children: [
            SearchBarFilter(
              hintText: AppLocalizations.of(context)!.agent_search_hint,
              onChanged: (value) {
                setState(() {
                  _searchQuery = value.toLowerCase();
                });
              },
              onFilterTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (_) =>
                      Center(
                        child: Text(AppLocalizations.of(context)!.agent_filters_placeholder),
                      ),
                );
              },
            ),
            const SizedBox(height: 16),
            BlocBuilder<AgentBloc, AgentState>(
              builder: (context, state) {
                final int total =
                    (state is AgentLoaded) ? state.agents.length : 0;
                return AgentDetailsHeader(totalAgents: total);
              },
            ),
            const AgentChart(),
            const SizedBox(height: 10),
            BlocBuilder<AgentBloc, AgentState>(
              builder: (context, state) {
                if (state is AgentLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is AgentLoaded) {
                  final query = _searchQuery.trim().toLowerCase();

                  final filteredAgents = state.agents.where((agent) {
                    final first = agent.firstName.toLowerCase();
                    final last = agent.lastName.toLowerCase();
                    final full = "$first $last";
                    return first.contains(query) ||
                        last.contains(query) ||
                        full.contains(query);
                  }).toList();

                  return AgentDetailsBody(agents: filteredAgents);
                } else if (state is AgentError) {
                  return Center(
                    child: Text(AppLocalizations.of(context)!.error_generic),
                  );
                }

                return Center(
                  child: Text(AppLocalizations.of(context)!.no_data),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
